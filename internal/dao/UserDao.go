package dao

import (
	"gorm.io/gorm"
	"online-practice-system/global"
	"online-practice-system/internal/model"
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
	err = global.App.DB.Where("username = ?", username).First(&user).Error
	return
}

// GetUserByUsernameOrEmail 根据邮箱查询用户
func (userDao *userDao) GetUserByMail(mail string) (err error, user *model.UserBasic) {
	err = global.App.DB.Where("mail = ?", mail).First(&user).Error
	return
}

// GetOneById GetUserInfo 根据id获取用户信息
func (userDao *userDao) GetOneById(id uint) (err error, user model.UserBasic) {
	err = global.App.DB.First(&user, id).Error
	return
}

// GetListByPage 分页查询用户排名列表
// page: 页码, size: 每页数量
func (userDao *userDao) GetRankListByPage(page int, size int) (
	userList []model.UserBasic, total int64, err error) {
	// 排名根据通过数和提交数排序
	err = global.App.DB.Model(&model.UserBasic{}).Count(&total).
		Order("pass_num Desc, submit_num Asc").
		Offset((page - 1) * size).Limit(size).Find(&userList).Error

	if err != nil {
		return nil, 0, err
	}

	return
}

// 更新用户的提交数和通过数，受事务管理
func (userDao *userDao) UpdateSubmitAndPassInfo(tx *gorm.DB, id uint, addSubmit int,
	addPass int) (err error) {
	err = tx.Model(&model.UserBasic{}).Where("id = ?", id).Updates(map[string]interface{}{
		"submit_num": gorm.Expr("submit_num + ?", addSubmit),
		"pass_num":   gorm.Expr("pass_num + ?", addPass),
	}).Error
	return
}
