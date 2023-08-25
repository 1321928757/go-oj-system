package dao

import (
	"online-practice-system/global"
	"online-practice-system/model"
	"strconv"
)

type userDao struct {
}

var UserDao = new(userDao)

// AddUser 添加用户
func (userDao *userDao) AddUser(user *model.User) (err error) {
	err = global.App.DB.Create(&user).Error
	return
}

// GetUserByUsername 根据用户名查询用户
func (userDao *userDao) GetUserByUsername(username string) (err error, user *model.User) {
	err = global.App.DB.Where("username = ?", username).First(&user).Error
	return
}

// GetOneById GetUserInfo 根据id获取用户信息
func (userDao *userDao) GetOneById(id string) (err error, user model.User) {
	intId, err := strconv.Atoi(id)
	err = global.App.DB.First(&user, intId).Error
	return
}
