package routes

import (
	"github.com/gin-gonic/gin"
	"online-practice-system/internal/controller"
	"online-practice-system/internal/middleware"
	"online-practice-system/internal/service"
)

// SetUserGroupRoutes 定义 User 分组路由
func SetUserGroupRoutes(router *gin.RouterGroup) {
	userGroup := router.Group("/user")

	userGroup.POST("/register", controller.UserController.Register)
	userGroup.POST("/login", controller.UserController.Login)
	userGroup.GET("/rank", controller.UserController.GetRankList)

	//用户登录校验
	authRouter := userGroup.Use(middleware.JWTAuthLogin(service.AppGuardName))
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
	//管理员身份校验
	authRouter := problemGroup.Use(middleware.JWTAuthAdmin(service.AppGuardName))
	{
		authRouter.POST("/add", controller.ProblemController.AddProblem)
		authRouter.PUT("/update", controller.ProblemController.UpdateProblem)
		authRouter.DELETE("/delete", controller.ProblemController.DeleteProblem)
	}
}

// SetSubmitGroupRoutes 定义 Submit 分组路由
func SetSubmitGroupRoutes(router *gin.RouterGroup) {
	submitGroup := router.Group("/submit")
	submitGroup.GET("/list", controller.SubmitController.GetSubmitPageList)
	//用户登录校验
	authRouter := submitGroup.Use(middleware.JWTAuthLogin(service.AppGuardName))
	{
		authRouter.POST("/commit", controller.SubmitController.SendSubmit)
	}
}

// SetCaptchaGroupRoutes 定义 Captcha验证码相关 分组路由
func SetCaptchaGroupRoutes(router *gin.RouterGroup) {
	submitGroup := router.Group("/captcha")
	submitGroup.POST("/send_email", controller.CaptchaController.SendMailCode)
}

// SetCategoryGroupRoutes 定义 分类 分组路由
func SetCategoryGroupRoutes(router *gin.RouterGroup) {
	submitGroup := router.Group("/category")
	submitGroup.GET("/list", controller.CategoryController.GetCategoryPageList)
	//管理员身份校验
	authRouter := submitGroup.Use(middleware.JWTAuthAdmin(service.AppGuardName))
	{
		authRouter.POST("/add", controller.CategoryController.AddCategory)
		authRouter.PUT("/update", controller.CategoryController.UpdateCategory)
		authRouter.DELETE("/delete", controller.CategoryController.RemoveCategory)
	}
}
