package storage

import (
	"errors"
	"fmt"
	"io"
	"online-practice-system/global"
)

type DriverName string

// 驱动名
const (
	Local DriverName = "local"      // 本地
	KoDo  DriverName = "qi_niu"     // 七牛云
	Oss   DriverName = "ali_oss"    // 阿里云
	Cos   DriverName = "tecent_cos" // 腾讯云
)

var (
	FileNotFoundErr     = errors.New("fileDriver not found")
	FileNoPermissionErr = errors.New("permission denied")
)

// Storage 存储驱动接口，自定义的存储驱动需要实现该接口
type Storage interface {
	// Put 上传文件
	Put(key string, r io.Reader, dataLength int64) error
	// PutFile 上传本地文件
	PutFile(key string, localFile string) error
	// Get 获取文件
	Get(key string) (io.ReadCloser, error)
	// Rename 重命名文件
	Rename(srcKey string, destKey string) error
	// Copy 复制文件
	Copy(srcKey string, destKey string) error
	// Exists 判断文件是否存在
	Exists(key string) (bool, error)
	// Size 获取文件大小
	Size(key string) (int64, error)
	// Delete 删除文件
	Delete(key string) error
	// Url 获取文件访问URL
	Url(key string) string
}

// 存储驱动集合，DriverNameName为驱动名，Storage为驱动
var drivers = make(map[DriverName]Storage)

// 注册存储驱动
func Register(name DriverName, disk Storage) {
	if disk == nil {
		panic("storage: Register disk is nil")
	}
	drivers[name] = disk
}

// 根据驱动名获取存储驱动
func GetDriverByName(name DriverName) (Storage, error) {
	disk, exist := drivers[name]
	//遍历打印所有驱动
	if !exist {
		return nil, fmt.Errorf("获取存储驱动错误: 未找到对于存储驱动 %q", name)
	}
	return disk, nil
}

// 使用过程中获取存储驱动实例的统一入口
func FileDriver(disk ...string) (Storage, error) {
	// 若未传参，默认使用配置文件驱动
	// 读取默认配置
	diskNameStr := global.App.Config.Storage.Default
	// 将str字符转换为自定义的DriverName类型
	diskName := DriverName(diskNameStr)
	// 若传参，使用传参的驱动名
	if len(disk) > 0 {
		diskName = DriverName(disk[0])
	}
	s, err := GetDriverByName(diskName)
	if err != nil {
		return nil, err
	}
	return s, nil
}
