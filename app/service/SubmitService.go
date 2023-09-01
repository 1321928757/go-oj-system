package service

import (
	"online-practice-system/app/dao"
	"online-practice-system/app/vo"
)

type submitService struct{}

var SubmitService = new(submitService)

// 分页条件查询提交记录
func (submitService) GetSubmitList(pageNum int, pageSize int, problemId int,
	userId int) (submitPageVo vo.SubmitPageVo, err error) {
	err, list, total := dao.SubmitDao.GetSubmitList(pageNum, pageSize, problemId, userId)
	if err != nil {
		return
	}
	submitPageVo = vo.SubmitPageVo{
		PageList: list,
		Count:    total,
	}
	return
}
