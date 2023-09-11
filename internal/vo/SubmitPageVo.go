package vo

import (
	"online-practice-system/internal/model"
)

type SubmitPageVo struct {
	PageList []model.SubmitBasic `json:"page_list"` // 分页数据
	Count    int64               `json:"count"`     // 总数
}

type SubmitReturnVo struct {
	model.SubmitBasic
	RunMsg string `json:"run_msg"`
}
