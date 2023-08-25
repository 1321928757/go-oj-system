package bootstrap

import (
	"github.com/gin-gonic/gin/binding"
	"github.com/go-playground/validator/v10"
	"reflect"
	"strings"
)

// 初始化验证器
func InitializeValidator() {
	// 获取当前gin框架绑定的验证器引擎，将其转换为*validator.Validate类型
	if v, ok := binding.Validator.Engine().(*validator.Validate); ok {
		// 注册自定义验证规则
		//_ = v.RegisterValidation("mobile", utils.ValidateMobile) 手机号校验示例

		// 注册自定义 json tag 函数，对要校验的字段只需在tag中添加binding:"mobile(注册的自定义校验器tag)"即可
		v.RegisterTagNameFunc(func(fld reflect.StructField) string {
			name := strings.SplitN(fld.Tag.Get("json"), ",", 2)[0]
			if name == "-" {
				return ""
			}
			return name
		})
	}
}
