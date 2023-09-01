package controller

import (
	"github.com/gin-gonic/gin"
	"online-practice-system/app/common/request"
	"online-practice-system/app/common/response"
	"online-practice-system/app/service"
)

type submitController struct{}

var SubmitController = new(submitController)

func (submitController) GetSubmitPageList(c *gin.Context) {
	// 提取分页参数，提取查询条件参数等
	var query request.SubmitPageParam
	if err := c.Bind(&query); err != nil {
		response.ValidateFail(c, request.GetErrorMsg(query, err))
		return
	}

	// 调用service层的方法，获取分页数据
	problemPageVo, err := service.SubmitService.GetSubmitList(query.Page, query.PageSize,
		query.ProblemId, query.UserId)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}
	response.Success(c, problemPageVo)
}
