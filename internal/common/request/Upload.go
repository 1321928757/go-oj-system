package request

import "mime/multipart"

// 文件上传请求参数
type ImageUpload struct {
	Business string                `form:"business" json:"business" binding:"required"` // 业务类型
	Image    *multipart.FileHeader `form:"image" json:"image" binding:"required"`
}

// 自定义错误信息
func (imageUpload ImageUpload) GetMessages() ValidatorMessages {
	return ValidatorMessages{
		"business.required": "业务类型不能为空",
		"image.required":    "请选择图片",
	}
}
