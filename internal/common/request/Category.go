package request

// CategoryPageParam 条件分页查询分类列表请求参数
type CategoryPageParam struct {
	Page     int    `form:"page" binding:"required"`
	PageSize int    `form:"pageSize" binding:"required"`
	Keyword  string `form:"keyword"`
}

// GetMessages 自定义错误信息
func (CategoryPageParam) GetMessages() ValidatorMessages {
	return ValidatorMessages{
		"page.required":     "当前页数不能为空",
		"pageSize.required": "页码大小不能为空",
	}
}
