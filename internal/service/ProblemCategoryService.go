package service

import (
	"gorm.io/gorm"
	"online-practice-system/internal/dao"
	"online-practice-system/internal/model"
)

type problemCategoryService struct {
}

var ProblemCategoryService = new(problemCategoryService)

// 新建问题分类关联信息
func (problemCategoryService *problemCategoryService) CreateProblemCategory(
	tx *gorm.DB, problemCategories []*model.ProblemCategory) (err error) {
	err = dao.ProblemCategoryDao.CreateProblemCategoryBatch(tx, problemCategories)
	return
}
