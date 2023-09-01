package bootstrap

import (
	"github.com/jordan-wright/email"
	"go.uber.org/zap"
	"net/smtp"
	"online-practice-system/global"
	"online-practice-system/pkg/mail"
)

func InitializeEmailDriver() *mail.EmailDriver {
	// 初始化邮箱连接池
	emailConfig := global.App.Config.Email
	p, err := email.NewPool(
		emailConfig.Host+":"+emailConfig.Port,
		emailConfig.MaxConnection,
		smtp.PlainAuth("", emailConfig.SenderEmail, emailConfig.SenderPassword,
			emailConfig.Host),
	)
	if err != nil {
		global.App.Log.Fatal("初始化邮件连接池失败, 错误:", zap.Any("err", err))
	}
	emailDriver := &mail.EmailDriver{
		EmailPool:   p,
		EmailConfig: emailConfig,
	}
	return emailDriver
}
