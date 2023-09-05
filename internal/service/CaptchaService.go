package service

import (
	"context"
	"errors"
	"fmt"
	"online-practice-system/global"
	"online-practice-system/utils"
	"time"
)

type captchaService struct {
}

var CaptchaService = new(captchaService)

// 发送邮箱验证码
func (captchaService) SendEmailCode(mail string) (err error) {
	// 发送验证码前应该判断是否短期内发送过验证码
	result, err := global.App.Redis.Get(context.Background(), mail).Result()
	if err != nil && err.Error() != "redis: nil" {
		return
	}
	if result != "" {
		err = errors.New("验证码请求过于频繁，请稍后重试")
		return
	}
	// 生成随机验证码
	code := utils.RandString(global.App.Config.Captcha.EmailNumber)
	// 设置邮件内容
	content := fmt.Sprintf("您的验证码是: %s，请在5分钟内完成验证。", code)
	// 保存验证码到redis，并发送邮件
	err = global.App.Redis.Set(context.Background(), mail, code,
		global.App.Config.Captcha.EmailTimeout*time.Second).Err()
	if err != nil {
		return
	}
	err = global.App.EmailDriver.SendRegisterMail(mail, "验证码通知", content)
	return
}
