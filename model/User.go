package model

import "strconv"

type User struct {
	CommonModel
	Username string `json:"username" gorm:"column:username;type:varchar(255);not null"`
	Password string `json:"-" gorm:"column:password;type:varchar(255);not null"`
}

func (user User) TableName() string {
	return "user"
}

func (user User) GetUid() string {
	return strconv.Itoa(int(user.ID))
}
