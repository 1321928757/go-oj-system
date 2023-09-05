package vo

import "online-practice-system/internal/model"

type UserRankPageVo struct {
	PageList []model.UserBasic `json:"page_list"` // 分页数据
	Count    int64             `json:"count"`     // 总数
}

// 用户登录后的返回数据
type UserLogineVo struct {
	*model.UserBasic
	Token string `json:"token"`
}
