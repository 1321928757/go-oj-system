package model

import (
	"database/sql/driver"
	"fmt"
	"time"
)

// 自定义格式化的时间类型
type LocalTime time.Time

// 重写MarshalJSON方法，实现自定义格式化
func (t *LocalTime) MarshalJSON() ([]byte, error) {
	tTime := time.Time(*t)
	return []byte(fmt.Sprintf("\"%v\"", tTime.Format("2006-01-02 15:04:05"))), nil
}

func (t LocalTime) Value() (driver.Value, error) {
	var zeroTime time.Time
	tlt := time.Time(t)
	//判断给定时间是否和默认零时间的时间戳相同
	if tlt.UnixNano() == zeroTime.UnixNano() {
		return nil, nil
	}
	return tlt, nil
}
func (t *LocalTime) Scan(v interface{}) error {
	if value, ok := v.(time.Time); ok {
		*t = LocalTime(value)
		return nil
	}
	return fmt.Errorf("can not convert %v to timestamp", v)
}

// CommonModel 全部常用的公用字段
type CommonModel struct {
	ID        uint       `json:"id" gorm:"column:id;primary_key;AUTO_INCREMENT;"`
	CreatedAt *LocalTime `json:"created_at"`
	UpdatedAt *LocalTime `json:"updated_at"`
	DeletedAt *LocalTime `json:"deleted_at" gorm:"index"`
}

// ID 自增ID主键
type ID struct {
	ID uint `json:"id" gorm:"primaryKey"`
}

// Timestamps 创建、更新时间
type Timestamps struct {
	CreatedAt *LocalTime `json:"created_at"`
	UpdatedAt *LocalTime `json:"updated_at"`
}

// SoftDeletes 软删除
type SoftDeletes struct {
	DeletedAt *LocalTime `json:"deleted_at" gorm:"index"`
}
