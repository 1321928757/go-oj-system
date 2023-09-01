package main

import (
	"fmt"
	"github.com/jordan-wright/email"
	"net/smtp"
	"testing"
)

func main() {
	EmailTest(&testing.T{})
}

// 测试使用github.com/jordan-wright/email库发送邮件
func EmailTest(t *testing.T) {
	email := email.NewEmail()
	email.From = "test <1321928757@qq.com>"
	email.To = []string{"suv4d3but@163.com"}
	email.Subject = "go邮箱发送测试"
	email.Text = []byte("Text Body is, of course, supported!")
	err := email.Send("smtp.qq.com:587", smtp.PlainAuth("", "1321928757@qq.com",
		"xmysseozfhnsiieb", "smtp.qq.com"))
	if err != nil {
		fmt.Printf("发送失败: %v", err)
		t.Error(err)
	}
}
