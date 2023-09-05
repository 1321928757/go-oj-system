package model

type CategoryBasic struct {
	ID uint `gorm:"primarykey;" json:"id"`
	Timestamps
	Name     string `gorm:"column:name;type:varchar(100);unique" json:"name"` // 分类名称
	ParentId uint   `gorm:"column:parent_id;type:int(11);" json:"parent_id"`  // 父级ID
}

func (table *CategoryBasic) TableName() string {
	return "category_basic"
}
