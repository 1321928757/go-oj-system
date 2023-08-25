package bootstrap

import (
	"context"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"online-practice-system/app/middleware"
	"online-practice-system/global"
	"online-practice-system/routes"
	"os"
	"os/signal"
	"syscall"
	"time"
)

// 初始化路由
func setupRouter() *gin.Engine {
	if global.App.Config.App.Env == "production" {
		gin.SetMode(gin.ReleaseMode)
	}
	router := gin.New()
	router.Use(gin.Logger(), middleware.Cors(), middleware.CustomRecovery())

	// 前端项目静态资源
	router.Static("/storage", "./storage/app/public")
	//router.StaticFile("/", "./static/dist/index.html")
	//router.Static("/js", "./static/dist/js")
	//router.Static("/fonts", "./static/dist/fonts")
	//router.Static("/img", "./static/dist/img")
	//router.StaticFile("/favicon.ico", "./static/dist/favicon.ico")

	// 注册 api 分组路由
	apiGroup := router.Group("/api")
	routes.SetUserGroupRoutes(apiGroup)

	return router
}

// RunServer 启动服务器
func RunServer() {
	r := setupRouter()

	//创建一个 http.Server 对象 srv，其中指定服务器的监听地址和路由处理器为之前设置的路由 r
	srv := &http.Server{
		Addr:    ":" + global.App.Config.App.Port,
		Handler: r,
	}

	//使用 srv.ListenAndServe() 方法来异步启动服务器。
	go func() {
		if err := srv.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			global.App.Log.Fatal("服务器启动失败：" + err.Error())
		}
	}()

	// 等待中断信号以优雅地关闭服务器（设置 5 秒的超时时间）, 当收到中断信号时，会触发 quit 通道，从而执行后续的关闭服务器操作。
	quit := make(chan os.Signal)
	//Notify函数让signal包将输入的中断信号 SIGINT 或终止信号 SIGTERM 转发到通道quit
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	//收到信号后，会执行下面的代码，首先打印日志，然后调用 srv.Shutdown() 方法来关闭服务器。
	<-quit
	log.Println("Shutdown Server ...")

	//创建一个带有超时的上下文 ctx，超时时间设置为 5 秒
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	//调用 srv.Shutdown() 方法来关闭服务器，此时会触发 http.Server 的关闭事件，从而退出阻塞
	if err := srv.Shutdown(ctx); err != nil {
		global.App.Log.Fatal("服务器关闭时出现错误：" + err.Error())
	}
	global.App.Log.Fatal("服务器顺利关闭~~~")
}
