package dao

import (
	"gorm.io/gorm"
	"online-practice-system/global"
	"online-practice-system/internal/model"
)

type submitDao struct{}

var SubmitDao = new(submitDao)

// 分页条件查询提交记录
func (submitDao) GetSubmitList(pageIndex int, pageSize int, status int) (err error, list []model.SubmitBasic, total int64) {
	// 构建基本查询
	tx := global.App.DB.Model(&model.SubmitBasic{}).Offset((pageIndex - 1) * pageSize).Limit(pageSize)
	if status != 0 {
		tx = tx.Where("status = ?", status)
	}

	// 查询总记录数
	err = tx.Count(&total).Error
	if err != nil {
		return
	}

	// 执行查询,忽略content字段
	err = tx.Preload("ProblemBasic", func(db *gorm.DB) *gorm.DB {
		return db.Omit("content")
	}).Preload("UserBasic").Find(&list).Error
	return
}

// 添加单个提交记录
func (d submitDao) SaveSubmit(tx *gorm.DB, basic *model.SubmitBasic) error {
	return tx.Create(basic).Error
}
