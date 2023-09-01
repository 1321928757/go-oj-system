package utils

import (
	"github.com/go-playground/validator/v10"
	"regexp"
)

// 自定义校验规则，字段的校验规则都可以放这里

// ValidateMobile 手机号校验规则，供给validator/v10自定义校验规则使用
func ValidatorValidateMobile(fl validator.FieldLevel) bool {
	mobile := fl.Field().String()
	ok, _ := regexp.MatchString(`^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$`, mobile)
	if !ok {
		return false
	}
	return true
}

// ValidateMobile 手机号校验规则
func ValidateMobile(phone string) bool {
	ok, _ := regexp.MatchString(`^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$`, phone)
	if !ok {
		return false
	}
	return true
}

// ValidateEmail 邮箱校验规则
func ValidateEmail(email string) bool {
	ok, _ := regexp.MatchString(`^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`, email)
	return ok
}
