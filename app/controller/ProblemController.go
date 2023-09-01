package controller

import (
	"github.com/gin-gonic/gin"
	"online-practice-system/app/common/request"
	"online-practice-system/app/common/response"
	"online-practice-system/app/service"
	"strconv"
)

type problemController struct {
}

var ProblemController = new(problemController)

// GetProblemPageList
// @Tags 公共方法
// @Produce json
// @Summary 获取问题列表
// @Param page query int true "页码"
// @Param pageSize query int true "每页数量"
// @Param keyword query string false "关键字"
// @Success 200 {object}  ProblemPageVo
// @Router /api/problem/list [get]
func (problemController *problemController) GetProblemPageList(c *gin.Context) {
	// 提取分页参数，提取查询条件参数等
	var query request.ProblemPageParam
	if err := c.Bind(&query); err != nil {
		response.ValidateFail(c, request.GetErrorMsg(query, err))
		return
	}

	// 调用service层的方法，获取分页数据
	problemPageVo, err := service.ProblemService.GetProblemListByPage(query.Page,
		query.PageSize, query.Keyword, query.Category)
	if err != nil {
		response.BusinessFail(c, err.Error())

		return
	}

	response.Success(c, problemPageVo)
}

// GetProblemDetailById
// @Tags 公共方法
// @Produce json
// @Summary 根据id获取问题详细信息
// @Param id query int true "问题id"
// @Success 200 {object}  ProblemBasic
// @Router /api/problem/detail/{id} [get]
func (problemController *problemController) GetProblemDetailById(c *gin.Context) {
	// 获取问题id参数
	idStr := c.Query("id")
	if idStr == "" {
		response.ValidateFail(c, "参数校验未通过")
		return
	}
	// 转换id为对应的类型
	id, err := strconv.Atoi(idStr)
	if err != nil {
		response.ValidateFail(c, "参数校验未通过")
		return
	}

	// 调用service层的方法，获取问题详细信息
	problemBasic, err := service.ProblemService.GetProblemDetailById(id)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}
	response.Success(c, problemBasic)
}
