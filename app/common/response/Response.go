package response

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"online-practice-system/global"
	"os"
)

// 响应结构体
type Response struct {
	Code    int         `json:"code"`    // 自定义错误码
	Data    interface{} `json:"data"`    // 数据
	Message string      `json:"message"` // 信息
}

// Success 响应成功 ErrorCode 为 200 表示成功
func Success(c *gin.Context, data interface{}) {
	c.JSON(http.StatusOK, Response{
		http.StatusOK,
		data,
		"ok",
	})
}

// Fail 响应失败 ErrorCode 不为 200表示失败
func Fail(c *gin.Context, errorCode int, msg string) {
	c.JSON(http.StatusOK, Response{
		errorCode,
		nil,
		msg,
	})
}

// FailByError 失败响应 返回自定义错误的错误码、错误信息
func FailByError(c *gin.Context, error global.CustomError) {
	Fail(c, error.ErrorCode, error.ErrorMsg)
}

// ValidateFail 请求参数验证失败
func ValidateFail(c *gin.Context, msg string) {
	Fail(c, global.Errors.ValidateError.ErrorCode, msg)
}

// BusinessFail 业务逻辑失败
func BusinessFail(c *gin.Context, msg string) {
	Fail(c, global.Errors.BusinessError.ErrorCode, msg)
}

// TokenFail  token 鉴权失败
func TokenFail(c *gin.Context) {
	FailByError(c, global.Errors.TokenError)
}

// ServerError 返回服务器内部错误的响应，当发生 panic 时，会触发 CustomRecovery 中间件进行recovery操作，从而调用此函数
func ServerError(c *gin.Context, err interface{}) {
	msg := "Internal Server Error"
	// 非生产环境显示具体错误信息
	if global.App.Config.App.Env != "production" && os.Getenv(gin.EnvGinMode) != gin.ReleaseMode {
		if _, ok := err.(error); ok {
			msg = err.(error).Error()
		}
	}
	c.JSON(http.StatusInternalServerError, Response{
		http.StatusInternalServerError,
		nil,
		msg,
	})
	c.Abort()
}
