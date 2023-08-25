package dao

import (
	"online-practice-system/global"
	"online-practice-system/model"
)

type mediaDao struct {
}

var MediaDao = new(mediaDao)

// AddMedia 添加一条媒体数据
func (mediaDao *mediaDao) AddMedia(media *model.Media) (err error) {
	err = global.App.DB.Create(&media).Error
	return
}

// GetOneById 通过 id 获取媒体数据
func (mediaDao *mediaDao) GetOneById(id int64) (err error, media model.Media) {
	err = global.App.DB.First(&media, id).Error
	return
}
