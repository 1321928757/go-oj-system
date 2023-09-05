package service

import (
	"context"
	"errors"
	"gorm.io/gorm"
	"online-practice-system/global"
	"online-practice-system/internal/common/request"
	"online-practice-system/internal/dao"
	"online-practice-system/internal/model"
	"online-practice-system/internal/vo"
	"online-practice-system/utils"
)

type userService struct {
}

var UserService = new(userService)

// Register 注册
func (userService *userService) Register(userRegister request.UserRegister) (err error, user *model.UserBasic) {
	// 判断邮箱是否已存在，不存在会返回err
	err, user = dao.UserDao.GetUserByMail(userRegister.Mail)

	// 处理数据库错误,
	if err != nil && !errors.Is(err, gorm.ErrRecordNotFound) {
		return
	}

	// 3. 用户名已存在返回错误
	if user.ID != 0 {
		err = errors.New("该邮箱已被注册")
		return
	}

	// 验证码校验
	result, err := global.App.Redis.Get(context.Background(), userRegister.Mail).Result()
	if err != nil && err.Error() != "redis: nil" {
		return
	}
	if result != userRegister.Vericode {
		err = errors.New("验证码错误或过期")
		return
	}

	// 成功注册，添加用户
	user = &model.UserBasic{Username: userRegister.Username, Password: utils.BcryptMake(userRegister.Password),
		Mail: userRegister.Mail}
	err = dao.UserDao.AddUser(user)
	if err != nil {
		return
	}
	// 删除验证码缓存,防止二次使用
	global.App.Redis.Del(context.Background(), userRegister.Mail)
	return
}

// Login 登录
func (userService *userService) Login(userLogin request.UserLogin) (err error, user *model.UserBasic) {
	err, user = dao.UserDao.GetUserByUsername(userLogin.Username)
	if err != nil || !utils.BcryptMakeCheck(userLogin.Password, user.Password) {
		err = errors.New("用户不存在或密码错误")
	}
	return
}

// GetUserInfo 根据id获取用户信息
func (userService *userService) GetUserInfoByid(id uint) (err error, user model.UserBasic) {
	err, user = dao.UserDao.GetOneById(id)
	if err != nil {
		err = errors.New("数据不存在")
	}
	return
}

// GetRankList 获取用户排名分页数据
func (userService *userService) GetRankList(page int, size int) (err error, pageVo vo.UserRankPageVo) {
	list, total, err := dao.UserDao.GetRankListByPage(page, size)
	if err != nil {
		return
	}

	pageVo = vo.UserRankPageVo{
		PageList: list,
		Count:    total,
	}
	return
}
