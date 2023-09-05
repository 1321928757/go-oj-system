package controller

import (
	"github.com/gin-gonic/gin"
	"online-practice-system/internal/common/response"
	"online-practice-system/internal/service"
	"online-practice-system/utils/validator"
)

type captchaController struct {
}

var CaptchaController = new(captchaController)

// SendMailCode
// @Tags 公共方法
// @Produce json
// @Summary 发送邮箱验证码
// @Form email  int true "待发送验证码的邮箱"
// @Success 200 {string} string	"验证码发送成功"
// @Router /api/captcha/send_email [post]
func (captchaController) SendMailCode(c *gin.Context) {
	//获取email参数
	email := c.PostForm("email")
	if email == "" || !validator.ValidateEmail(email) {
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
