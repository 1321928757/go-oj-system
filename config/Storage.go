package config

import (
	"online-practice-system/config/fileDriver"
)

type Storage struct {
	Default    string  `mapstructure:"default" yaml:"default"`           // 默认使用的驱动，local本地 oss阿里云 kodo七牛云
	ImgMaxSize int64   `mapstructure:"img_max_size" yaml:"img_max_size"` // 图片最大上传大小（M）
	Drivers    Drivers `mapstructure:"drivers" yaml:"drivers"`           //驱动配置
}

type Drivers struct {
	Local     fileDriver.LocalConfig `mapstructure:"local" yaml:"local"`
	AliOss    fileDriver.AliConfig   `mapstructure:"ali_oss" yaml:"ali_oss"`
	QiNiu     fileDriver.QiNiuConfig `mapstructure:"qi_niu" yaml:"qi_niu"`
	TecentCos fileDriver.CosConfig   `mapstructure:"tecent_cos" yaml:"tecent_cos"`
}
