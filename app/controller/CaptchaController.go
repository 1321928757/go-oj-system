package controller

import (
	"github.com/gin-gonic/gin"
	"online-practice-system/app/common/response"
	"online-practice-system/app/service"
	"online-practice-system/utils"
)

type captchaController struct {
}

var CaptchaController = new(captchaController)

func (captchaController) SendMailCode(c *gin.Context) {
	//获取email参数
	email := c.PostForm("email")
	if email == "" || !utils.ValidateEmail(email) {
		response.ValidateFail(c, "邮箱地址格式错误")
		return
	}
	// 调用service层的方法，发送验证码
	err := service.CaptchaService.SendEmailCode(email)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}

	response.Success(c, "邮箱验证码发送成功")
}
