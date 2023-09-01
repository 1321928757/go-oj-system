package dao

import (
	"online-practice-system/global"
	"online-practice-system/pkg/model"
)

type problemDao struct {
}

var ProblemDao = new(problemDao)

// GetListByPage 分页条件查询问题列表
// page: 页码, size: 每页数量, keyword: 关键字, categoryName: 分类名称
func (problemDao *problemDao) GetListByPage(page int, size int, keyword string, categoryName string) (
	problemList []model.ProblemBasic, total int64, err error) {
	// 构建基本查询
	tx := global.App.DB.Model(&model.ProblemBasic{}).Omit("content").Offset((page-1)*size).Limit(size).
		Where("title LIKE ? OR content LIKE ?", "%"+keyword+"%", "%"+keyword+"%")

	// 添加关联表查询条件
	if categoryName != "" {
		tx = tx.Joins("JOIN problem_category ON problem_category.problem_id = problem_basic.id").
			Joins("JOIN category_basic AS cb ON cb.id = problem_category.category_id").
			Where("cb.name = ?", categoryName)
	}

	// 查询总记录数
	err = tx.Count(&total).Error
	if err != nil {
		return nil, 0, err
	}

	// 执行查询
	err = tx.Preload("ProblemCategories").Preload("ProblemCategories.CategoryBasic").
		Find(&problemList).Error
	if err != nil {
		return nil, 0, err
	}

	return
}

// 根据id查询问题详细信息
func (problemDao *problemDao) GetProblemDetailById(id int) (problemBasic model.ProblemBasic, err error) {
	err = global.App.DB.Where("id = ?", id).Preload("ProblemCategories").
		Preload("ProblemCategories.CategoryBasic").Preload("TestCases").
		First(&problemBasic).Error
	return
}
