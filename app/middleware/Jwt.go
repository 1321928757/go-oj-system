package middleware

import (
	"github.com/gin-gonic/gin"
	"online-practice-system/app/common/response"
	"online-practice-system/app/service"
	"online-practice-system/global"
	"strconv"
	"time"
)

// JWTAuth JWT 鉴权中间件
func JWTAuth(GuardName string) gin.HandlerFunc {
	return func(c *gin.Context) {
		// Token 获取
		tokenStr := c.Request.Header.Get("Authorization")
		if tokenStr == "" {
			response.TokenFail(c)
			c.Abort() // 终止请求
			return
		}
		// 去掉 token 前缀
		tokenStr = tokenStr[len(service.TokenType)+1:]

		// Token 解析校验
		token, claims, err := service.JwtService.ParseToken(tokenStr)

		// Token 黑名单校验
		if err != nil || service.JwtService.IsInBlacklist(tokenStr) {
			response.TokenFail(c)
			c.Abort()
			return
		}

		// Token 发布者校验和过期校验
		if claims.Issuer != GuardName || !token.Valid {
			response.TokenFail(c)
			c.Abort()
			return
		}

		// token 续签
		if claims.ExpiresAt.Time.Unix()-time.Now().Unix() < global.App.Config.Jwt.RefreshGracePeriod {
			//  使用了锁机制来确保只有一个续签操作在运行
			lock := global.Lock("refresh_token_lock", global.App.Config.Jwt.JwtBlacklistGracePeriod)
			if lock.Get() {
				err, user := service.JwtService.GetUserInfo(GuardName, claims.ID)
				if err != nil {
					global.App.Log.Error(err.Error())
					lock.Release()
				} else {
					tokenData, _, _ := service.JwtService.CreateToken(GuardName, user)
					c.Header("new-token", tokenData.AccessToken)
					c.Header("new-expires-in", strconv.Itoa(tokenData.ExpiresIn))
					_ = service.JwtService.JoinBlackList(token)
				}
			}
		}

		c.Set("token", token)
		c.Set("id", claims.ID)
	}
}
