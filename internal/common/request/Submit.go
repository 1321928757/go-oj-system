package request

// SubmitPageParam 条件分页查询提交列表请求参数
type SubmitPageParam struct {
	Page     int `form:"page" binding:"required"`
	PageSize int `form:"pageSize" binding:"required"`
	Status   int `form:"status"`
}

func (SubmitPageParam) GetMessages() ValidatorMessages {
	return ValidatorMessages{
		"page.required":     "当前页数不能为空",
		"pageSize.required": "页码大小不能为空",
	}

}

// SubmitSendParam 用户提交代码请求参数
type SubmitSendParam struct {
	ProblemId uint   `json:"problemId" binding:"required"`
	Code      string `json:"code" binding:"required"`
}

func (SubmitSendParam) GetMessages() ValidatorMessages {
	return ValidatorMessages{
		"problemId.required": "提交问题id不能为空",
		"code.required":      "提交代码不能为空",
	}
}
