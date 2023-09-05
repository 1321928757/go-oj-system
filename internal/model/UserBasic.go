package model

type UserBasic struct {
	ID uint `gorm:"primarykey;" json:"id"`
	Timestamps
	Username  string `gorm:"column:username;type:varchar(100);" json:"username"` // 用户名
	Password  string `gorm:"column:password;type:varchar(255);" json:"-"`        // 密码
	Phone     string `gorm:"column:phone;type:varchar(20);" json:"phone"`        // 手机号
	Mail      string `gorm:"column:mail;type:varchar(100);" json:"mail"`         // 邮箱
	PassNum   int64  `gorm:"column:pass_num;type:int(11);" json:"pass_num"`      // 通过的次数
	SubmitNum int64  `gorm:"column:submit_num;type:int(11);" json:"submit_num"`  // 提交次数
	IsAdmin   int    `gorm:"column:is_admin;type:tinyint(1);" json:"is_admin"`   // 是否是管理员【0-否，1-是】
}

func (table *UserBasic) TableName() string {
	return "user_basic"
}

func (user UserBasic) GetUid() uint {
	return user.ID
}

func (user UserBasic) GetIsAdmin() int {
	return user.IsAdmin
}

func (user UserBasic) GetMail() string {
	return user.Mail
}
