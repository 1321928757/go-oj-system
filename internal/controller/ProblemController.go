package controller

import (
	"github.com/gin-gonic/gin"
	"online-practice-system/internal/common/request"
	"online-practice-system/internal/common/response"
	"online-practice-system/internal/service"
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
// @Success 200 {object}  vo.ProblemPageVo
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
// @Success 200 {object}  model.ProblemBasic
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

// AddProblem
// @Tags 管理员私有方法
// @Produce json
// @Summary 新增问题
// @Param authorization header string true "用户token"
// @Param data body request.ProblemAddParam true "新增问题参数ProblemAddParam"
// @Success 200 {string} json "{"code":"200","data":"添加成功"}"
// @Router /api/problem/add [post]
func (problemController *problemController) AddProblem(c *gin.Context) {
	// 提取参数
	var problemAddParam request.ProblemAddParam
	if err := c.ShouldBindJSON(&problemAddParam); err != nil {
		response.ValidateFail(c, request.GetErrorMsg(problemAddParam, err))
		return
	}

	// 新增问题
	err := service.ProblemService.CreateProblem(problemAddParam)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}

	response.Success(c, nil)
}

// UpdateProblem
// @Tags 管理员私有方法
// @Produce json
// @Summary 修改问题
// @Param authorization header string true "用户token"
// @Param data body model.ProblemBasic true "问题修改后的内容"
// @Success 200 {string} json "{"code":"200","data":"修改成功"}"
// @Router /api/problem/update [put]
func (problemController *problemController) UpdateProblem(c *gin.Context) {
	// 提取参数
	var problem request.ProblemUpdateParam
	if err := c.ShouldBindJSON(&problem); err != nil {
		response.ValidateFail(c, request.GetErrorMsg(problem, err))
		return
	}

	// 修改问题
	err := service.ProblemService.UpdateProblem(problem)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}

	response.Success(c, nil)
}

// DeleteProblem
// @Tags 管理员私有方法
// @Produce json
// @Summary 删除问题
// @Param authorization header string true "用户token"
// @Paraid query int true "待删除的问题1id"
// @Success 200 {string} json "{"code":"200","data":"删除成功"}"
// @Router /api/problem/delete [delete]
func (problemController *problemController) DeleteProblem(c *gin.Context) {
	idStr := c.Query("id")
	if idStr == "" {
		response.ValidateFail(c, "参数校验未通过")
		return
	}
	//转换id为对应的类型
	id, err := strconv.Atoi(idStr)
	if err != nil {
		response.ValidateFail(c, "参数校验未通过")
		return
	}

	// 删除问题
	err = service.ProblemService.RemoveOneById(uint(id))
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}

	response.Success(c, nil)
}
