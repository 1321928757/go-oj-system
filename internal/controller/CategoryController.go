package controller

import (
	"github.com/gin-gonic/gin"
	"online-practice-system/internal/common/request"
	"online-practice-system/internal/common/response"
	"online-practice-system/internal/model"
	"online-practice-system/internal/service"
	"strconv"
)

type categoryController struct{}

var CategoryController = new(categoryController)

// GetCategoryPageList
// @Summary 获取分类列表
// @Tags 公有方法
// @Produce json
// @Param page query int true "页码"
// @Param pageSize query int true "每页数量"
// @Param keyword query string false "关键字"
// @Success 200 {object} string "ok"
// @Router /api/category/list [get]
func (categoryController) GetCategoryPageList(c *gin.Context) {
	// 提取分页参数，提取查询条件参数等
	var query request.CategoryPageParam
	if err := c.Bind(&query); err != nil {
		response.ValidateFail(c, request.GetErrorMsg(query, err))
		return
	}

	// 调用service层的方法，获取分页数据
	vo, err := service.CategoryService.GetCategoryList(query.Page, query.PageSize, query.Keyword)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}
	response.Success(c, vo)
}

// UpdateCategory
// @Summary 修改分类信息
// @Tags 管理员私有方法
// @Produce json
// @Param data body model.CategoryBasic true "修改的对应分类信息"
// @Success 200 {object} string "ok"
// @Router /api/category/update [put]
func (categoryController) UpdateCategory(c *gin.Context) {
	var category model.CategoryBasic
	if err := c.ShouldBindJSON(&category); err != nil {
		response.ValidateFail(c, err.Error())
		return
	}

	err := service.CategoryService.UpdateCategory(category)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}

	response.Success(c, "分类信息修改成功")
}

// AddCategory
// @Summary 新增分类信息
// @Tags 管理员私有方法
// @Produce json
// @Param data body model.CategoryBasic true "新增的对应分类信息"
// @Success 200 {object} string "ok"
// @Router /api/category/add [post]
func (categoryController) AddCategory(c *gin.Context) {
	var category model.CategoryBasic
	if err := c.ShouldBindJSON(&category); err != nil {
		response.ValidateFail(c, err.Error())
		return
	}

	err := service.CategoryService.AddCategory(category)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}

	response.Success(c, "分类信息新增成功")
}

// RemoveCategory
// @Summary 删除分类信息
// @Tags 管理员私有方法
// @Produce json
// @Paraid query int true "待删除的分类1id"
// @Success 200 {object} string "ok"
// @Router /api/category/remove [delete]
func (categoryController) RemoveCategory(c *gin.Context) {
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

	err = service.CategoryService.RemoveCategory(id)
	if err != nil {
		response.BusinessFail(c, err.Error())
		return
	}

	response.Success(c, "分类信息删除成功")
}
