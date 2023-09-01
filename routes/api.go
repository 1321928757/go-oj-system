package routes

import (
	"github.com/gin-gonic/gin"
	"online-practice-system/app/controller"
	"online-practice-system/app/middleware"
	"online-practice-system/app/service"
)

// SetUserGroupRoutes 定义 User 分组路由
func SetUserGroupRoutes(router *gin.RouterGroup) {
	userGroup := router.Group("/user")

	userGroup.POST("/register", controller.UserController.Register)
	userGroup.POST("/login", controller.UserController.Login)

	//使用 JWTAuth 鉴权中间件
	authRouter := userGroup.Use(middleware.JWTAuth(service.AppGuardName))
	{
		authRouter.GET("/userInfo", controller.UserController.GetUserInfo)
		authRouter.GET("/logout", controller.UserController.UserLogout)
		authRouter.POST("/image_upload", controller.UploadController.ImageUpload)
		authRouter.GET("/image_get_url/:id", controller.UploadController.GetUrlById)
	}
}

// SetProblemGroupRoutes 定义 Problem 分组路由
func SetProblemGroupRoutes(router *gin.RouterGroup) {
	problemGroup := router.Group("/problem")
	problemGroup.GET("/list", controller.ProblemController.GetProblemPageList)
	problemGroup.GET("/detail", controller.ProblemController.GetProblemDetailById)
}

// SetSubmitGroupRoutes 定义 Submit 分组路由
func SetSubmitGroupRoutes(router *gin.RouterGroup) {
	submitGroup := router.Group("/submit")
	submitGroup.GET("/list", controller.SubmitController.GetSubmitPageList)
}

// SetCaptchaGroupRoutes 定义 Captcha验证码相关分组路由
func SetCaptchaGroupRoutes(router *gin.RouterGroup) {
	submitGroup := router.Group("/captcha")
	submitGroup.POST("/send_email", controller.CaptchaController.SendMailCode)
}
