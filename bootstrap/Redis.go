package bootstrap

import (
	"context"
	"github.com/redis/go-redis/v9"
	"go.uber.org/zap"
	"online-practice-system/global"
)

// InitializeRedis 初始化 Redis
func InitializeRedis() *redis.Client {
	redisConfig := global.App.Config.Redis
	client := redis.NewClient(&redis.Options{
		Addr:     redisConfig.Host + ":" + redisConfig.Port,
		Password: redisConfig.Password, // no password set
		DB:       redisConfig.DB,       // use default DB
	})
	_, err := client.Ping(context.Background()).Result()
	if err != nil {
		global.App.Log.Fatal("Redis连接失败, 错误:", zap.Any("err", err))
		return nil
	}
	return client
}
