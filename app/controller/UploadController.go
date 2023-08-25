package controller

import (
	"github.com/gin-gonic/gin"
	"online-practice-system/app/common/request"
	"online-practice-system/app/common/response"
	"online-practice-system/app/service"
	"online-practice-system/global"
	"online-practice-system/utils"
	"strconv"
)

type uploadController struct {
}

var UploadController = new(uploadController)
var ImageMaxSize int64 = 1024 * 1024 * 2 // 图片文件上传最大大小，默认2MB

// ImageUpload 上传图片
// @Tags 用户公有方法
// @Produce json
// @Summary 上传图片
// @Param image formData file true "图片"
// @Param business formData string true "业务参数"
// @Success 200 {object}  service.outPut
// @Router /image_upload [post]
func (uploadController) ImageUpload(c *gin.Context) {
	// 参数校验
	var form request.ImageUpload
	if err := c.ShouldBind(&form); err != nil {
		response.ValidateFail(c, request.GetErrorMsg(form, err))
		return
	}

	//文件类型大小校验
	var file = form.Image
	// 校验文件类型
	contentType := file.Header.Get("Content-Type")
	if !utils.IsValidImageType(contentType) {
		response.ValidateFail(c, "文件类型不合法")
		return
	}
	// 校验文件大小
	if file.Size > ImageMaxSize {
		response.ValidateFail(c, "文件大小超出限制")
		return
	}

	outPut, err := service.MediaService.SaveImage(form)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}
	response.Success(c, outPut)
}

// GetUrlById 根据id获取图片url
// @Tags 用户公有方法
// @Produce json
// @Summary 根据id获取图片url
// @Param id path int true "图片id"
// @Success 200 {string} string	"url"
// @Router /image_get_url/{id} [get]
func (uploadController) GetUrlById(c *gin.Context) {
	//获取参数id，并将id转换成int64类型
	id, err := strconv.ParseInt(c.Param("id"), 10, 64)
	if err != nil {
		response.ValidateFail(c, err.Error())
		return
	}
	media, err := service.MediaService.GetUrlById(id)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}
	response.Success(c, media)
}

func init() {
	if global.App.Config.Storage.ImgMaxSize != 0 {
		ImageMaxSize = global.App.Config.Storage.ImgMaxSize * 1024 * 1024
	}
}
