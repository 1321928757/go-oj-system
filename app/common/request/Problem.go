package request

// ProblemPageParam 条件分页查询题目列表请求参数
type ProblemPageParam struct {
	Page     int    `form:"page" binding:"required"`
	PageSize int    `form:"pageSize" binding:"required"`
	Keyword  string `form:"keyword"`
	Category string `form:"category"`
}

// GetMessages 自定义错误信息
func (ProblemPageParam) GetMessages() ValidatorMessages {
	return ValidatorMessages{
		"Page.required":     "当前页数不能为空",
		"PageSize.required": "页码大小不能为空",
	}
}
