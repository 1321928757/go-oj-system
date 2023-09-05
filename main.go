package main

import (
	"online-practice-system/bootstrap"
	"online-practice-system/global"
)

// @title 在线练习系统
// @description 在线练习系统API文档
// @version 1
//
//go:generate swag init --parseDependency --parseInternal
func main() {
	//  初始化yaml配置文件
	bootstrap.InitializeConfig()
	//  初始化日志
	global.App.Log = bootstrap.InitializeLog()
	//  初始化数据库
	global.App.DB = bootstrap.InitializeDB()
	// 初始化验证器
	bootstrap.InitializeValidator()
	// 初始化Redis
	global.App.Redis = bootstrap.InitializeRedis()
	// 初始化存储驱动
	bootstrap.StorageInit()
	// 初始化邮件发送连接池
	global.App.EmailDriver = bootstrap.InitializeEmailDriver()
	//  程序关闭前，释放数据库连接
	defer func() {
		if global.App.DB != nil {
			db, _ := global.App.DB.DB()
			db.Close()
		}
		// 关闭 Redis 连接
		if global.App.Redis != nil {
			global.App.Redis.Close()
		}
	}()

	// 启动gin web服务器
	bootstrap.RunServer()
}
