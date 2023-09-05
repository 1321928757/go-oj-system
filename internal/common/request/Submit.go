package request

// SubmitPageParam 条件分页查询提交列表请求参数
type SubmitPageParam struct {
	Page      int `form:"page" binding:"required"`
	PageSize  int `form:"pageSize" binding:"required"`
	UserId    int `form:"userId"`
	ProblemId int `form:"problemId"`
}

func (SubmitPageParam) GetMessages() ValidatorMessages {
	return ValidatorMessages{
		"Page.required":     "当前页数不能为空",
		"PageSize.required": "页码大小不能为空",
	}

}

// SubmitSendParam 用户提交代码请求参数
type SubmitSendParam struct {
	ProblemId uint   `json:"problemId" binding:"required"`
	Code      string `json:"code" binding:"required"`
}

func (SubmitSendParam) GetMessages() ValidatorMessages {
	return ValidatorMessages{
		"ProblemId.required": "问题id不能为空",
		"Code.required":      "提交代码不能为空",
	}
}
