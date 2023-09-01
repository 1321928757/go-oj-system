package service

import (
	"errors"
	"gorm.io/gorm"
	"online-practice-system/app/dao"
	"online-practice-system/app/vo"
	"online-practice-system/pkg/model"
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
