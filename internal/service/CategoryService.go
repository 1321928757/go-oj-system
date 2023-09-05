package service

import (
	"errors"
	"online-practice-system/internal/dao"
	"online-practice-system/internal/model"
	"online-practice-system/internal/vo"
)

type categoryService struct {
}

var CategoryService = new(categoryService)

// GetCategoryList 获取分类列表
func (categoryService *categoryService) GetCategoryList(page, pageSize int, key string) (
	categoryPageVo vo.CategoryPageVo, err error) {
	// 获取分类列表
	list, total, err := dao.CategoryDao.GetListByPage(page, pageSize, key)
	if err != nil {
		return
	}
	categoryPageVo = vo.CategoryPageVo{
		PageList: list,
		Count:    total,
	}
	return
}

func (categoryService *categoryService) UpdateCategory(category model.CategoryBasic) (err error) {
	err = dao.CategoryDao.UpdateCategory(category)
	return
}

func (categoryService *categoryService) AddCategory(category model.CategoryBasic) (err error) {
	err = dao.CategoryDao.AddCategory(category)
	return
}

func (categoryService *categoryService) RemoveCategory(id int) (err error) {
	//删除分类前需要判断该分类下是否有题目，如果有题目则不能删除
	count, err := dao.ProblemCategoryDao.GetCountByCategoryId(id)
	if err != nil {
		return
	}
	if count > 0 {
		err = errors.New("该分类下有题目，不能删除")
		return
	}

	err = dao.CategoryDao.RemoveCategory(id)
	return
}
