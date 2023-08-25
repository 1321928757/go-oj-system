/*
腾讯云Cos存储驱动
*/
package cos

import (
	"context"
	tecentcos "github.com/tencentyun/cos-go-sdk-v5"
	"github.com/tencentyun/cos-go-sdk-v5/debug"
	"io"
	"net/http"
	"net/url"
	"online-practice-system/config/fileDriver"
	"online-practice-system/global"
	"online-practice-system/utils"
	"online-practice-system/utils/storage"
	"sync"
	"time"
)

// local 本地存储驱动
type cos struct {
	client *tecentcos.Client
	config *fileDriver.CosConfig
}

var (
	c    *cos
	once *sync.Once
)

// Init 初始化本地存储驱动
func Init(config fileDriver.CosConfig) (storage.Storage, error) {
	once = &sync.Once{}
	once.Do(func() { //sync.Once 确保其中的函数只会执行一次，防止多次调用init导致多次注册引擎
		//初始化cos驱动
		baseUrl := "https://" + config.Bucket + ".cos." + config.Domain + ".myqcloud.com"
		u, _ := url.Parse(baseUrl)
		b := &tecentcos.BaseURL{BucketURL: u}
		c = &cos{
			client: tecentcos.NewClient(b, &http.Client{
				Transport: &tecentcos.AuthorizationTransport{
					SecretID:  global.App.Config.Storage.Drivers.TecentCos.SecretId,
					SecretKey: global.App.Config.Storage.Drivers.TecentCos.SecretKey,
					Transport: &debug.DebugRequestTransport{
						RequestHeader:  true,
						RequestBody:    false,
						ResponseHeader: true,
						ResponseBody:   false,
					},
				},
			}),
			config: &config,
		}

		storage.Register(storage.Cos, c)

	})
	return c, nil
}

func (c cos) Put(key string, r io.Reader, dataLength int64) error {
	//腾讯云cos上传文件
	//打印key
	_, err := c.client.Object.Put(context.Background(), key, r, nil)
	if err != nil {
		err.Error()
	}

	return err
}

func (c cos) PutFile(key string, localFile string) error {
	_, err := c.client.Object.PutFromFile(context.Background(), key, localFile, nil)
	if err != nil {
		err.Error()
	}
	return err
}

func (c cos) Get(key string) (io.ReadCloser, error) {
	response, err := c.client.Object.Get(context.Background(), key, nil)
	file := response.Body
	if err != nil {
		err.Error()
	}
	return file, err
}

func (c cos) Rename(srcKey string, destKey string) error {
	srcKey = utils.NormalizeKey(srcKey)
	destKey = utils.NormalizeKey(destKey)

	// 改名其实就是复制文件，然后删除原文件
	_, _, err := c.client.Object.Copy(context.Background(), srcKey, destKey, nil)
	if err != nil {
		return err
	}

	_, err = c.client.Object.Delete(context.Background(), srcKey)
	if err != nil {
		return err
	}

	return nil
}

func (c cos) Copy(srcKey string, destKey string) error {
	srcKey = utils.NormalizeKey(srcKey)
	destKey = utils.NormalizeKey(destKey)

	_, _, err := c.client.Object.Copy(context.Background(), srcKey, destKey, nil)
	if err != nil {
		return err
	}

	return nil
}

func (c cos) Exists(key string) (bool, error) {
	key = utils.NormalizeKey(key)
	return c.client.Object.IsExist(context.Background(), key)
}

func (c cos) Size(key string) (int64, error) {
	key = utils.NormalizeKey(key)

	// 获取文件信息
	head, err := c.client.Object.Head(context.Background(), key, nil)
	if err != nil {
		return 0, err
	}

	return head.ContentLength, nil
}

func (c cos) Delete(key string) error {
	key = utils.NormalizeKey(key)

	_, err := c.client.Object.Delete(context.Background(), key)
	if err != nil {
		return err
	}

	return nil
}

func (c cos) Url(key string) string {
	var prefix string
	key = utils.NormalizeKey(key)

	if c.config.IsSsl {
		prefix = "https://"
	} else {
		prefix = "http://"
	}

	// 如果是私有存储桶，则通过 o.bucket.SignURL 方法生成带有签名的 URL
	if c.config.IsPrivate {
		presignedURL, err := c.client.Object.GetPresignedURL(context.Background(), http.MethodGet, key,
			c.config.SecretId, c.config.SecretKey, time.Hour, nil)
		if err == nil {
			return presignedURL.String()
		}
	}

	return prefix + c.config.Bucket + ".cos." + c.config.Domain + ".myqcloud.com" + "/" + key
}
