package model

type TestCase struct {
	ID uint `gorm:"primarykey;" json:"id"`
	Timestamps
	ProblemId uint   `gorm:"column:problem_id;type:varchar(255);" json:"problem_id"`
	Input     string `gorm:"column:input;type:text;" json:"input"`
	Output    string `gorm:"column:output;type:text;" json:"output"`
}

func (table *TestCase) TableName() string {
	return "test_case"
}
