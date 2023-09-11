package model

type SubmitBasic struct {
	ID uint `gorm:"primarykey;" json:"id"`
	Timestamps
	ProblemId    uint          `gorm:"column:problem_id;type:int(11);" json:"problem_id"`         // 问题表的唯一标识
	ProblemBasic *ProblemBasic `gorm:"foreignKey:id;references:problem_id;" json:"problem_basic"` // 关联问题基础表
	UserId       uint          `gorm:"column:user_id;type:int(11);" json:"user_id"`               // 用户表的唯一标识
	UserBasic    *UserBasic    `gorm:"foreignKey:id;references:user_id;" json:"user_basic"`       // 关联用户基础表
	Path         string        `gorm:"column:path;type:varchar(255);" json:"path"`                // 代码存放路径
	Status       int           `gorm:"column:status;type:tinyint(1);" json:"status"`              // 【-1-待判断，1-答案正确，2-答案错误，3-运行超时，4-运行超内存， 5-编译错误，6-非法代码】
	TestNum      int           `gorm:"test_num" json:"test_num"`                                  // 测试用例个数
	PassNum      int           `gorm:"pass_num" json:"pass_num"`                                  // 通过测试用例个数
}

func (table *SubmitBasic) TableName() string {
	return "submit_basic"
}
