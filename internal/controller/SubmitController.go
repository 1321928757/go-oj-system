package controller

import (
	"github.com/gin-gonic/gin"
	"online-practice-system/internal/common/request"
	"online-practice-system/internal/common/response"
	"online-practice-system/internal/service"
)

type submitController struct{}

var SubmitController = new(submitController)

// GetSubmitPageList
// @Tags 公共方法
// @Produce json
// @Summary 获取提交记录
// @Param data body request.SubmitPageParam true "查询参数"
// @Success 200 {string} string	""
// @Router /api/submit/list [get]
func (submitController) GetSubmitPageList(c *gin.Context) {
	// 提取分页参数，提取查询条件参数等
	var query request.SubmitPageParam
	if err := c.Bind(&query); err != nil {
		response.ValidateFail(c, request.GetErrorMsg(query, err))
		return
	}

	// 调用service层的方法，获取分页数据
	problemPageVo, err := service.SubmitService.GetSubmitList(query.Page, query.PageSize,
		query.Status)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}
	response.Success(c, problemPageVo)
}

// sendSubmit
// @Tags 用户私有方法
// @Produce json
// @Summary 用户提交代码
// @Param data body request.SubmitSendParam true "查询参数"
// @Success 200 {string} string	""
// @Router /api/submit/commit [post]
func (submitController) SendSubmit(c *gin.Context) {
	// 提取分页参数，提取查询条件参数等
	var submitSendParam request.SubmitSendParam
	if err := c.ShouldBindJSON(&submitSendParam); err != nil {
		response.ValidateFail(c, request.GetErrorMsg(submitSendParam, err))
		return
	}

	//获取用户id
	userId := c.GetUint("user_id")

	//获取用户邮箱
	userMail := c.GetString("user_mail")
	// 调用service层的方法，保存提交记录，开始判题
	submitBasic, err := service.SubmitService.SaveSubmitAndJudge(userId, userMail, submitSendParam)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}
	response.Success(c, submitBasic)
}
