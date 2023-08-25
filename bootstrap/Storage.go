package bootstrap

import (
	"online-practice-system/global"
	"online-practice-system/utils/storage/cos"
	"online-practice-system/utils/storage/kodo"
	"online-practice-system/utils/storage/local"
	"online-practice-system/utils/storage/oss"
)

// StorageInit 存储驱动初始化
func StorageInit() {
	//初始化本地存储驱动
	local.Init(global.App.Config.Storage.Drivers.Local)
	//初始化其他存储驱动（如腾讯云，阿里云，七牛云等）
	cos.Init(global.App.Config.Storage.Drivers.TecentCos)
	oss.Init(global.App.Config.Storage.Drivers.AliOss)
	kodo.Init(global.App.Config.Storage.Drivers.QiNiu)
}
