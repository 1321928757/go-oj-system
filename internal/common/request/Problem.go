package request

import "online-practice-system/internal/model"

// ProblemPageParam 条件分页查询题目列表请求参数
type ProblemPageParam struct {
	Page     int    `form:"page" binding:"required"`
	PageSize int    `form:"pageSize" binding:"required"`
	Keyword  string `form:"keyword"`
	Category string `form:"category"`
}

// GetMessages 自定义错误信息
func (ProblemPageParam) GetMessages() ValidatorMessages {
	return ValidatorMessages{
		"page.required":     "当前页数不能为空",
		"pageSize.required": "页码大小不能为空",
	}
}

type ProblemAddParam struct {
	Title             string            `json:"title" binding:"required"`              // 问题标题
	Content           string            `json:"content" binding:"required"`            // 问题内容
	ProblemCategories []uint            `json:"problem_categories" binding:"required"` // 问题分类id数组
	MaxRuntime        int               `json:"max_runtime" binding:"required"`        // 最大运行时长
	MaxMem            int               `json:"max_mem" binding:"required"`            // 最大运行内存
	TestCases         []*model.TestCase `json:"test_cases" binding:"required"`         // 关联测试用例表
}

func (ProblemAddParam) GetMessages() ValidatorMessages {
	return ValidatorMessages{
		"title.required":              "题目标题不能为空",
		"content.required":            "题目内容不能为空",
		"problem_categories.required": "题目分类不能为空",
		"max_runtime.required":        "最大运行时间不能为空",
		"max_mem.required":            "最大运行内容不能为空",
		"test_cases.required":         "测试案例不能为空",
	}
}

type ProblemUpdateParam struct {
	ID                uint              `json:"id" binding:"required"`                 //问题id
	Title             string            `json:"title" binding:"required"`              // 问题标题
	Content           string            `json:"content" binding:"required"`            // 问题内容
	ProblemCategories []uint            `json:"problem_categories" binding:"required"` // 问题分类id数组
	MaxRuntime        int               `json:"max_runtime" binding:"required"`        // 最大运行时长
	MaxMem            int               `json:"max_mem" binding:"required"`            // 最大运行内存
	TestCases         []*model.TestCase `json:"test_cases" binding:"required"`         // 关联测试用例表
}

func (ProblemUpdateParam) GetMessages() ValidatorMessages {
	return ValidatorMessages{
		"id.required":                 "题目id不能为空",
		"title.required":              "题目标题不能为空",
		"content.required":            "题目内容不能为空",
		"problem_categories.required": "题目分类不能为空",
		"max_runtime.required":        "最大运行时间不能为空",
		"max_mem.required":            "最大运行内容不能为空",
		"test_cases.required":         "测试案例不能为空",
	}
}
