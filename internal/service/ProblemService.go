package service

import (
	"errors"
	"gorm.io/gorm"
	"online-practice-system/global"
	"online-practice-system/internal/common/request"
	"online-practice-system/internal/dao"
	"online-practice-system/internal/model"
	"online-practice-system/internal/vo"
)

type problemService struct {
}

var ProblemService = new(problemService)

// 获取问题列表
func (problemService) GetProblemListByPage(page int, size int, keyword string, category string) (
	problemPageVo vo.ProblemPageVo, err error) {
	list, count, err := dao.ProblemDao.GetListByPage(page, size, keyword, category)
	if err != nil {
		return
	}
	problemPageVo = vo.ProblemPageVo{
		PageList: list,
		Count:    count,
	}
	return
}

// 根据id查询问题详细信息
func (problemService) GetProblemDetailById(id int) (problemBasic model.ProblemBasic, err error) {
	problemBasic, err = dao.ProblemDao.GetProblemDetailById(id)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			err = errors.New("对应问题信息不存在")
		}
	}
	return
}

// 新增问题记录,同时新增测试用例记录和问题分类记录
func (problemService) CreateProblem(problemAddParam request.ProblemAddParam) (err error) {
	// 开启事务
	tx := global.App.DB.Begin()
	// 创建问题实体
	problemBasic := &model.ProblemBasic{
		Title:      problemAddParam.Title,
		Content:    problemAddParam.Content,
		MaxRuntime: problemAddParam.MaxRuntime,
		MaxMem:     problemAddParam.MaxMem,
	}
	err = dao.ProblemDao.CreateProblem(tx, problemBasic)
	if err != nil {
		err = errors.New("创建问题本体失败")
		tx.Rollback()
		return
	}

	// 获取到问题id
	problemId := problemBasic.ID

	// 保存问题分类的关联信息
	problemCategories := make([]*model.ProblemCategory, 0)
	for _, categoryId := range problemAddParam.ProblemCategories {
		problemCategory := &model.ProblemCategory{
			ProblemId:  problemId,
			CategoryId: categoryId,
		}
		problemCategories = append(problemCategories, problemCategory)
	}
	err = ProblemCategoryService.CreateProblemCategory(tx, problemCategories)
	if err != nil {
		err = errors.New("创建问题分类的关联信息失败")
		tx.Rollback()
		return
	}

	//保存问题测试用例的关联信息
	for _, testCase := range problemAddParam.TestCases {
		testCase.ProblemId = problemId
	}
	err = TestCaseService.CreateTestCaseBatch(tx, problemAddParam.TestCases)
	if err != nil {
		err = errors.New("创建问题测试用例的关联信息失败")
		tx.Rollback()
		return
	}

	//提交事务
	tx.Commit()
	return
}

// 修改问题记录，并同时修改关联信息
func (s problemService) UpdateProblem(problemUpdateParam request.ProblemUpdateParam) (err error) {
	// 开启事务
	tx := global.App.DB.Begin()

	// 修改问题本体
	//将problem转换为model.ProblemBasic类型
	problem := model.ProblemBasic{
		ID:         problemUpdateParam.ID,
		Title:      problemUpdateParam.Title,
		Content:    problemUpdateParam.Content,
		MaxRuntime: problemUpdateParam.MaxRuntime,
		MaxMem:     problemUpdateParam.MaxMem,
	}
	err = dao.ProblemDao.UpdateProblem(tx, problem)
	if err != nil {
		err = errors.New("修改问题失败，修改问题本体时出错")
		tx.Rollback()
		return
	}

	// 修改问题分类关联信息
	problemCategories := make([]*model.ProblemCategory, 0)
	for _, categoryId := range problemUpdateParam.ProblemCategories {
		problemCategory := &model.ProblemCategory{
			ProblemId:  problemUpdateParam.ID,
			CategoryId: categoryId,
		}
		problemCategories = append(problemCategories, problemCategory)
	}
	// 删除原先的数据，再添加
	err = dao.ProblemCategoryDao.RemoveBatchByProblemId(tx, problemUpdateParam.ID)
	// 添加分类关联信息
	err = dao.ProblemCategoryDao.CreateProblemCategoryBatch(tx, problemCategories)
	if err != nil {
		err = errors.New("修改问题失败，修改问题分类关联信息时出错")
		tx.Rollback()
		return
	}

	// 修改问题测试案例关联信息
	for _, testCase := range problemUpdateParam.TestCases {
		testCase.ProblemId = problemUpdateParam.ID
	}
	// 删除原先的数据，再添加
	err = dao.TestCaseDao.RemoveBatchByProblemId(tx, problemUpdateParam.ID)
	// 添加新的测试案例
	err = dao.TestCaseDao.CreateTestCaseBatch(tx, problemUpdateParam.TestCases)
	if err != nil {
		err = errors.New("修改问题失败，修改问题测试案例失败")
		tx.Rollback()
		return
	}

	// 提交事务
	tx.Commit()
	return
}

// 根据id删除单个问题
func (s problemService) RemoveOneById(id uint) (err error) {
	// 开启事务
	tx := global.App.DB.Begin()

	// 首先删除问题本体
	err = dao.ProblemDao.DeleteOneById(tx, id)
	if err != nil {
		err = errors.New("删除问题失败，删除问题本体时出现错误")
		tx.Rollback()
		return
	}

	// 删除分类关联信息
	err = dao.ProblemCategoryDao.RemoveBatchByProblemId(tx, id)
	if err != nil {
		err = errors.New("删除问题失败，删除问题分类关联信息时出现错误")
		tx.Rollback()
		return
	}

	// 删除对应的测试案例
	err = dao.TestCaseDao.RemoveBatchByProblemId(tx, id)
	if err != nil {
		err = errors.New("删除问题失败，删除对应测试案例时出现错误")
		tx.Rollback()
		return
	}

	// 提交事务
	tx.Commit()
	return
}
