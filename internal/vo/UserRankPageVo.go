package vo

import "online-practice-system/internal/model"

type UserRankPageVo struct {
	PageList []model.UserBasic `json:"page_list"` // 分页数据
	Count    int64             `json:"count"`     // 总数
}
