package dao

import (
	"gorm.io/gorm"
	"online-practice-system/global"
	"online-practice-system/internal/model"
)

type problemDao struct {
}

var ProblemDao = new(problemDao)

// GetListByPage 分页条件查询问题列表
// page: 页码, size: 每页数量, keyword: 关键字, categoryName: 分类名称
func (problemDao *problemDao) GetListByPage(page int, size int, keyword string, categoryName string) (
	problemList []model.ProblemBasic, total int64, err error) {
	// 构建基本查询
	tx := global.App.DB.Model(&model.ProblemBasic{}).Omit("content").
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
	err = tx.Offset((page - 1) * size).Limit(size).Preload("ProblemCategories").Preload("ProblemCategories.CategoryBasic").
		Find(&problemList).Error
	if err != nil {
		return nil, 0, err
	}

	return
}

// 根据id查询问题详细信息(预加载分类信息和测试用例信息)
func (problemDao *problemDao) GetProblemDetailById(id int) (problemBasic model.ProblemBasic, err error) {
	err = global.App.DB.Where("id = ?", id).Preload("ProblemCategories").
		Preload("ProblemCategories.CategoryBasic").Preload("TestCases").
		First(&problemBasic).Error
	return
}

// 根据id查询问题详细信息(预加载测试用例信息)
func (problemDao *problemDao) GetProblemTestCaseById(id uint) (problemBasic model.ProblemBasic, err error) {
	err = global.App.DB.Where("id = ?", id).Preload("TestCases").
		First(&problemBasic).Error
	return
}

// 新增问题记录，受事务管理
func (problemDao *problemDao) CreateProblem(tx *gorm.DB, problemBasic *model.ProblemBasic) (err error) {
	err = tx.Create(problemBasic).Error
	return
}

// 更新问题记录，受事务管理
func (problemDao *problemDao) UpdateProblem(tx *gorm.DB, problem model.ProblemBasic) (err error) {
	err = tx.Model(&model.ProblemBasic{}).Where("id = ?", problem.ID).Updates(problem).Error
	return
}

// 删除单个问题记录，受事务管理
func (problemDao *problemDao) DeleteOneById(tx *gorm.DB, id uint) (err error) {
	err = tx.Where("id = ?", id).Delete(&model.ProblemBasic{}).Error
	return
}

// 更新问题的提交数和通过数，受事务管理
func (problemDao *problemDao) UpdateSubmitAndPassInfo(tx *gorm.DB, id uint, addSubmit int,
	addPass int) (err error) {
	err = tx.Model(&model.ProblemBasic{}).Where("id = ?", id).Updates(map[string]interface{}{
		"submit_num": gorm.Expr("submit_num + ?", addSubmit),
		"pass_num":   gorm.Expr("pass_num + ?", addPass),
	}).Error
	return
}
