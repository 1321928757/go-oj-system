package dao

import (
	"gorm.io/gorm"
	"online-practice-system/global"
	"online-practice-system/internal/model"
)

type problemCategoryDao struct {
}

var ProblemCategoryDao = new(problemCategoryDao)

// 批量添加问题分类关联信息
func (problemCategoryDao *problemCategoryDao) CreateProblemCategoryBatch(
	tx *gorm.DB, problemCategories []*model.ProblemCategory) (err error) {
	err = tx.Create(&problemCategories).Error
	return
}

// 根据分类id获取分类关联信息的总量
func (problemCategoryDao *problemCategoryDao) GetCountByCategoryId(categoryId int) (count int64, err error) {
	err = global.App.DB.Model(&model.ProblemCategory{}).Where("category_id = ?", categoryId).Count(&count).Error
	return
}

// 删除指定id问题的关联分类信息
func (problemCategoryDao *problemCategoryDao) RemoveBatchByProblemId(tx *gorm.DB, problem_id uint) (err error) {
	err = tx.Where("problem_id = ?", problem_id).Delete(&model.ProblemCategory{}).Error
	return
}
