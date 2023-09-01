package mail

import (
	"fmt"
	"github.com/jordan-wright/email"
	"online-practice-system/config"
	"time"
)

/*
*
邮件相关操作的封装
*/
type EmailDriver struct {
	EmailPool   *email.Pool  //邮箱连接的线程池
	EmailConfig config.Email //邮箱相关的配置
}

// 发送邮件
func (s *EmailDriver) SendRegisterMail(to, title, content string) error {
	mail := s.buildRegisterMail(to, title, content)
	return s.EmailPool.Send(mail, s.EmailConfig.MaxTimeout*time.Second)
}

// 封装邮件信息
func (s *EmailDriver) buildRegisterMail(to, title, content string) *email.Email {
	config := s.EmailConfig
	email := email.NewEmail()
	email.From = fmt.Sprintf("%s <%s>", config.SenderName, config.SenderEmail)
	email.To = []string{to}
	email.Subject = title
	email.Text = []byte(content)
	// 设置属性
	return email
}
