package service

import (
	"errors"
	"gorm.io/gorm"
	"online-practice-system/app/common/request"
	"online-practice-system/app/dao"
	"online-practice-system/model"
	"online-practice-system/utils"
)

type userService struct {
}

var UserService = new(userService)

// Register 注册
func (userService *userService) Register(userRegister request.UserRegister) (err error, user *model.User) {
	// 判断用户是否已存在，不存在会返回err
	err, user = dao.UserDao.GetUserByUsername(userRegister.Username)

	// 处理数据库错误,
	if err != nil && !errors.Is(err, gorm.ErrRecordNotFound) {
		return
	}

	// 3. 用户名已存在返回错误
	if user.ID != 0 {
		err = errors.New("用户名已存在")
		return
	}
	user = &model.User{Username: userRegister.Username, Password: utils.BcryptMake(userRegister.Password)}
	err = dao.UserDao.AddUser(user)
	return
}

// Login 登录
func (userService *userService) Login(userLogin request.UserLogin) (err error, user *model.User) {
	err, user = dao.UserDao.GetUserByUsername(userLogin.Username)
	if err != nil || !utils.BcryptMakeCheck(userLogin.Password, user.Password) {
		err = errors.New("用户不存在或密码错误")
	}
	return
}

// GetUserInfo 根据id获取用户信息
func (userService *userService) GetUserInfoByid(id string) (err error, user model.User) {
	err, user = dao.UserDao.GetOneById(id)
	if err != nil {
		err = errors.New("数据不存在")
	}
	return
}
