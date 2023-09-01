package vo

import (
	"online-practice-system/pkg/model"
)

type ProblemPageVo struct {
	PageList []model.ProblemBasic `json:"page_list"` // 分页数据
	Count    int64                `json:"count"`     // 总数
}
