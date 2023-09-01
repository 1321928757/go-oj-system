package dao

import (
	"online-practice-system/global"
	"online-practice-system/pkg/model"
	"strconv"
)

type userDao struct {
}

var UserDao = new(userDao)

// AddUser 添加用户
func (userDao *userDao) AddUser(user *model.UserBasic) (err error) {
	err = global.App.DB.Create(&user).Error
	return
}

// GetUserByUsername 根据用户名查询用户
func (userDao *userDao) GetUserByUsername(username string) (err error, user *model.UserBasic) {
	err = global.App.DB.Where("name = ?", username).First(&user).Error
	return
}

// GetOneById GetUserInfo 根据id获取用户信息
func (userDao *userDao) GetOneById(id string) (err error, user model.UserBasic) {
	intId, err := strconv.Atoi(id)
	err = global.App.DB.First(&user, intId).Error
	return
}
