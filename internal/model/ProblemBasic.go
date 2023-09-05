package model

type ProblemBasic struct {
	ID                uint               `gorm:"primarykey;" json:"id"`
	Timestamps                           // 问题表的唯一标识
	ProblemCategories []*ProblemCategory `gorm:"foreignKey:problem_id;references:id" json:"problem_categories"` // 关联问题分类表
	Title             string             `gorm:"column:title;type:varchar(255);" json:"title"`                  // 文章标题
	Content           string             `gorm:"column:content;type:text;" json:"content"`                      // 文章正文
	MaxRuntime        int                `gorm:"column:max_runtime;type:int(11);" json:"max_runtime"`           // 最大运行时长
	MaxMem            int                `gorm:"column:max_mem;type:int(11);" json:"max_mem"`                   // 最大运行内存
	TestCases         []*TestCase        `gorm:"foreignKey:problem_id;references:id;" json:"test_cases"`        // 关联测试用例表
	PassNum           int64              `gorm:"column:pass_num;type:int(11);" json:"pass_num"`                 // 通过次数
	SubmitNum         int64              `gorm:"column:submit_num;type:int(11);" json:"submit_num"`             // 提交次数
}

func (table *ProblemBasic) TableName() string {
	return "problem_basic"
}
