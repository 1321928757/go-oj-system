package vo

import "online-practice-system/internal/model"

type CategoryPageVo struct {
	PageList []model.CategoryBasic `json:"page_list"` // 分页数据
	Count    int64                 `json:"count"`     // 总数
}
