package request

// 用户注册请求参数
type UserRegister struct {
	Username string `json:"Username" binding:"required"`
	Password string `json:"password" binding:"required"`
	Vericode string `json:"vericode" binding:"required"`
	CodeUuid string `json:"codeUuid" binding:"required"`
}

// 用户登录请求参数
type UserLogin struct {
	Username string `json:"Username" binding:"required"`
	Password string `json:"password" binding:"required"`
	Vericode string `json:"vericode" binding:"required"`
	CodeUuid string `json:"codeUuid" binding:"required"`
}

// 自定义错误信息
func (UserRegister) GetMessages() ValidatorMessages {
	return ValidatorMessages{
		"Username.required": "用户名称不能为空",
		"password.required": "用户密码不能为空",
		"vericode.required": "验证码不能为空",
		"codeUuid.required": "验证码对应的uuid不能为空",
	}
}

func (UserLogin) GetMessages() ValidatorMessages {
	return ValidatorMessages{
		"Username.required": "用户名称不能为空",
		"password.required": "用户密码不能为空",
		"vericode.required": "验证码不能为空",
		"codeUuid.required": "验证码对应的uuid不能为空",
	}
}
