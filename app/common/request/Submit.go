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
