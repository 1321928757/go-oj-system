package request

import "github.com/go-playground/validator/v10"

// Gin 自带验证器返回的错误信息格式不太友好，故在此自定义错误信息
type Validator interface {
	GetMessages() ValidatorMessages
}

type ValidatorMessages map[string]string

// GetErrorMsg 获取错误信息
func GetErrorMsg(request interface{}, err error) string {
	// 判断错误类型
	if _, isValidatorErrors := err.(validator.ValidationErrors); isValidatorErrors {
		// 判断request是否实现了Validator
		_, isValidator := request.(Validator)
		// 遍历错误,获取自定义错误信息
		for _, v := range err.(validator.ValidationErrors) {
			// 若 request 结构体实现 Validator 接口即可实现自定义错误信息
			if isValidator {
				if message, exist := request.(Validator).GetMessages()[v.Field()+"."+v.Tag()]; exist {
					return message
				}
			}
			return v.Error()
		}
	}

	// 若不是 Gin 自带验证器返回的错误，则返回默认错误信息
	return "Parameter error"
}
