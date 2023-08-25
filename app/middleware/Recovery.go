package middleware

import (
	"github.com/gin-gonic/gin"
	"gopkg.in/natefinch/lumberjack.v2"
	"online-practice-system/app/common/response"
	"online-practice-system/global"
)

// CustomRecovery 进行程序的恢复（防止程序因 panic 而终止）和记录错误日志的中间件
func CustomRecovery() gin.HandlerFunc {
	// 开启程序的恢复，并将错误日志写入到指定的日志文件中
	return gin.RecoveryWithWriter(
		&lumberjack.Logger{
			Filename:   global.App.Config.Log.RootDir + "/" + global.App.Config.Log.Filename,
			MaxSize:    global.App.Config.Log.MaxSize,
			MaxBackups: global.App.Config.Log.MaxBackups,
			MaxAge:     global.App.Config.Log.MaxAge,
			Compress:   global.App.Config.Log.Compress,
		},
		response.ServerError)
}
