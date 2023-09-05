package dao

import (
	"online-practice-system/global"
	"online-practice-system/internal/model"
)

type categoryDao struct {
}

var CategoryDao = new(categoryDao)

// 条件分页查询分类信息
func (categoryDao) GetListByPage(page, pageSize int, key string) (
	list []model.CategoryBasic, total int64, err error) {
	// 构建基本查询
	tx := global.App.DB.Model(&model.CategoryBasic{}).Offset((page - 1) * pageSize).Limit(pageSize)
	if key != "" {
		tx.Where("name LIKE ?", "%"+key+"%")
	}

	// 查询总记录数
	err = tx.Count(&total).Find(&list).Error
	return

}

func (d categoryDao) UpdateCategory(category model.CategoryBasic) error {
	return global.App.DB.Model(&model.CategoryBasic{}).Where("id = ?", category.ID).Updates(category).Error
}

func (d categoryDao) AddCategory(category model.CategoryBasic) error {
	return global.App.DB.Create(&category).Error
}

func (d categoryDao) RemoveCategory(id int) error {
	return global.App.DB.Where("id = ?", id).Delete(&model.CategoryBasic{}).Error
}
