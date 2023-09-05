package controller

import (
	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
	"online-practice-system/internal/common/request"
	"online-practice-system/internal/common/response"
	"online-practice-system/internal/define"
	"online-practice-system/internal/service"
	"strconv"
)

type userController struct {
}

var UserController = new(userController)

// Register
// @Tags 公共方法
// @Produce json
// @Summary 用户注册
// @Success 200 {object}  model.UserBasic
// @Router /api/user/register [post]
func (userController) Register(c *gin.Context) {
	var form request.UserRegister
	err := c.ShouldBindJSON(&form)
	if err != nil {
		response.ValidateFail(c, request.GetErrorMsg(form, err))
		return
	}

	err, user := service.UserService.Register(form)
	if err != nil {
		response.BusinessFail(c, err.Error())
	} else {
		response.Success(c, user)
	}
}

// Login
// @Tags 公共方法
// @Produce json
// @Summary 用户登录
// @Success 200 {object} service.TokenOutPut
// @Router /api/user/login [post]
func (userController) Login(c *gin.Context) {
	var form request.UserLogin
	if err := c.ShouldBindJSON(&form); err != nil {
		response.ValidateFail(c, request.GetErrorMsg(form, err))
		return
	}

	if err, user := service.UserService.Login(form); err != nil {
		response.BusinessFail(c, err.Error())
	} else {
		tokenData, err, _ := service.JwtService.CreateToken(service.AppGuardName, user)
		if err != nil {
			response.BusinessFail(c, err.Error())
			return
		}
		response.Success(c, tokenData)
	}
}

// GetUserInfo
// @Tags 普通用户方法
// @Produce json
// @Summary 获取用户信息
// @Security ApiKeyAuth
// @Success 200 {object}  model.UserBasic
// @Router /api/user/userInfo [get]
func (userController) GetUserInfo(c *gin.Context) {
	id := c.GetUint("user_id") // 从 JWTAuth 中间件中获取从token中读取到的id
	err, user := service.UserService.GetUserInfoByid(id)
	if err != nil {
		response.BusinessFail(c, err.Error())
	} else {
		response.Success(c, user)
	}
}

// UserLogout
// @Tags 普通用户方法
// @Produce json
// @Summary 用户登出
// @Security ApiKeyAuth
// @Success 200 {string} string	"ok"
// @Router /api/user/logout [get]
func (userController) UserLogout(c *gin.Context) {
	//  将token加入黑名单
	err := service.JwtService.JoinBlackList(c.Keys["token"].(*jwt.Token))
	if err != nil {
		response.BusinessFail(c, "登出失败，用户token加入黑名单失败")
		return
	}
	response.Success(c, nil)
}

// GetRankList
// @Tags 公共方法
// @Produce json
// @Summary 获取用户分页排名数据
// @Success 200 {object} vo.UserRankPageVo
// @Router /api/user/rank [get]
func (userController) GetRankList(c *gin.Context) {
	//获取请求参数
	pageStr := c.DefaultQuery("page", define.DefaultPageNum)
	pageSizeStr := c.DefaultQuery("pageSize", define.DefaultPageSize)
	//转换参数类型
	page, err := strconv.Atoi(pageStr)
	pageSize, err := strconv.Atoi(pageSizeStr)
	if err != nil {
		response.ValidateFail(c, "分页参数格式错误")
	}

	err, rankUserVo := service.UserService.GetRankList(page, pageSize)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}

	response.Success(c, rankUserVo)
}
