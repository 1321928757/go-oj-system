package vo

import (
	"online-practice-system/pkg/model"
)

type SubmitPageVo struct {
	PageList []model.SubmitBasic `json:"page_list"` // 分页数据
	Count    int64               `json:"count"`     // 总数
}
