package dao

import (
	"gorm.io/gorm"
	"online-practice-system/internal/model"
)

type testCaseDao struct {
}

var TestCaseDao = new(testCaseDao)

// 批量添加测试用例
func (testCaseDao *testCaseDao) CreateTestCaseBatch(tx *gorm.DB, testCases []*model.TestCase) (err error) {
	err = tx.Create(&testCases).Error
	return
}

// 批量删除测试用例，受事务管理
func (testCaseDao *testCaseDao) RemoveBatchByProblemId(tx *gorm.DB, id uint) (err error) {
	err = tx.Where("problem_id = ?", id).Delete(&model.TestCase{}).Error
	return
}
