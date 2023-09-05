package service

import (
	"gorm.io/gorm"
	"online-practice-system/internal/dao"
	"online-practice-system/internal/model"
)

type testCaseService struct{}

var TestCaseService = new(testCaseService)

// 批量添加测试用例
func (testCaseService *testCaseService) CreateTestCaseBatch(tx *gorm.DB, testCases []*model.TestCase) (err error) {
	err = dao.TestCaseDao.CreateTestCaseBatch(tx, testCases)
	return
}
