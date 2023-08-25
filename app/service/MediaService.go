package service

import (
	"context"
	"errors"
	"github.com/satori/go.uuid"
	"online-practice-system/app/common/request"
	"online-practice-system/app/dao"
	"online-practice-system/global"
	"online-practice-system/model"
	"online-practice-system/utils/storage"
	"path"
	"strconv"
	"time"
)

type mediaService struct {
}

var MediaService = new(mediaService)

type outPut struct {
	Id   int64  `json:"id"`
	Path string `json:"path"`
	Url  string `json:"url"`
}

const mediaCacheKeyPre = "media:"

// 文件存储目录
func (mediaService *mediaService) makeFaceDir(business string) string {
	return global.App.Config.App.Env + "/" + business
}

// HashName 生成文件名称（使用 uuid）
func (mediaService *mediaService) HashName(fileName string) string {
	fileSuffix := path.Ext(fileName)
	return uuid.NewV4().String() + fileSuffix
}

// SaveImage 保存图片（公共读）
func (mediaService *mediaService) SaveImage(params request.ImageUpload) (result outPut, err error) {
	file, err := params.Image.Open()
	defer file.Close()
	if err != nil {
		err = errors.New("上传失败")
		return
	}

	localPrefix := ""
	srcType := int8(2) // 本地保存为1相对路径，云存储保存为2网络链接
	// 本地文件存放路径为 storage/app/public，我们为文件路径配置了路由，
	// 配置了静态资源处理路由 router.Static("/storage", "./storage/app/public")
	// 所以此处不需要将 public/ 存入到 mysql 中，防止后续拼接文件 Url 错误
	if storage.DriverName(global.App.Config.Storage.Default) == storage.Local {
		localPrefix = "public" + "/"
		srcType = 1
	}
	// 拼接文件路径（格式为{生产环境}/{Business业务参数}/{uuid组合的文件名}）
	key := mediaService.makeFaceDir(params.Business) + "/" + mediaService.HashName(params.Image.Filename)
	fileDriver, err := storage.FileDriver()
	if err != nil {
		return
	}

	// 保存文件
	err = fileDriver.Put(localPrefix+key, file, params.Image.Size)
	if err != nil {
		return
	}

	// 保存文件信息到数据库
	image := model.Media{
		DiskType: string(global.App.Config.Storage.Default),
		SrcType:  srcType,
	}
	if srcType == 1 {
		image.Src = key // 本地保存为相对路径
	} else {
		image.Src = fileDriver.Url(key) // 云存储保存为网络链接
	}

	err = dao.MediaDao.AddMedia(&image)
	if err != nil {
		return
	}
	result = outPut{int64(image.ID.ID), key, fileDriver.Url(key)}
	return
}

// GetUrlById 通过 id 获取文件 url
func (mediaService *mediaService) GetUrlById(id int64) (url string, err error) {
	if id == 0 {
		err = errors.New("id 不能为空")
		return
	}

	// 首先尝试从缓存中获取
	cacheKey := mediaCacheKeyPre + strconv.FormatInt(id, 10)
	exist := global.App.Redis.Exists(context.Background(), cacheKey).Val()
	if exist == 1 {
		url = global.App.Redis.Get(context.Background(), cacheKey).Val()
		return
	}

	// 从数据库中获取
	err, media := dao.MediaDao.GetOneById(id)
	if err != nil {
		return
	}
	if media.SrcType == 1 {
		// 为本地文件拼接路径
		fileDriver, err1 := storage.FileDriver(media.DiskType)
		if err1 != nil {
			err = err1
			return
		}
		url = fileDriver.Url(media.Src)
	} else {
		// 云存储文件直接返回 url
		url = media.Src
	}
	// 将 url 存入缓存
	global.App.Redis.Set(context.Background(), cacheKey, url, time.Second*3*24*3600)

	return
}
