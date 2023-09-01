package global

import (
	"github.com/redis/go-redis/v9"
	"github.com/spf13/viper"
	"go.uber.org/zap"
	"gorm.io/gorm"
	"online-practice-system/config"
	"online-practice-system/pkg/mail"
)

// 全局变量
type Application struct {
	ConfigViper *viper.Viper
	Config      config.Configuration
	Log         *zap.Logger
	DB          *gorm.DB
	Redis       *redis.Client
	EmailDriver *mail.EmailDriver
}

var App = new(Application)
