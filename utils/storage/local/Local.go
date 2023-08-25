package local

import (
	"io"
	"online-practice-system/config/fileDriver"
	"online-practice-system/utils"
	"online-practice-system/utils/storage"
	"os"
	"path/filepath"
	"sync"
)

// local 本地存储驱动
type local struct {
	config *fileDriver.LocalConfig
}

var (
	l    *local
	once *sync.Once
)

func Init(config fileDriver.LocalConfig) (storage.Storage, error) {
	once = &sync.Once{}
	once.Do(func() {
		l = &local{
			config: &config,
		}

		storage.Register(storage.Local, l)
	})
	return l, nil
}

func (l *local) getPath(key string) string {
	key = utils.NormalizeKey(key)
	return filepath.Join(l.config.RootDir, key)
}

func (l *local) Put(key string, r io.Reader, dataLength int64) error {
	// 处理文件路径
	path := l.getPath(key)
	// 提取文件夹路径，如果文件夹不存在则创建
	dir, _ := filepath.Split(path)
	if err := os.MkdirAll(dir, os.ModePerm); err != nil {
		return err
	}

	// 创建文件
	fd, err := os.OpenFile(path, os.O_CREATE|os.O_RDWR|os.O_TRUNC, os.ModePerm)
	if err != nil {
		if os.IsPermission(err) {
			return storage.FileNoPermissionErr
		}
		return err
	}
	defer fd.Close()

	// 写入文件
	_, err = io.Copy(fd, r)

	return err
}

func (l *local) PutFile(key string, localFile string) error {
	path := l.getPath(localFile)

	fd, fileInfo, err := utils.OpenAsReadOnly(path)
	if err != nil {
		return err
	}
	defer fd.Close()

	return l.Put(key, fd, fileInfo.Size())
}

func (l *local) Get(key string) (io.ReadCloser, error) {
	path := l.getPath(key)

	fd, _, err := utils.OpenAsReadOnly(path)
	if err != nil {
		return nil, err
	}

	return fd, nil
}

func (l *local) Rename(srcKey string, destKey string) error {
	srcPath := l.getPath(srcKey)
	ok, err := l.Exists(srcPath)
	if err != nil {
		return err
	}
	if !ok {
		return storage.FileNoPermissionErr
	}

	destPath := l.getPath(destKey)
	dir, _ := filepath.Split(destPath)
	if err = os.MkdirAll(dir, os.ModePerm); err != nil {
		return err
	}

	return os.Rename(srcPath, destPath)
}

func (l *local) Copy(srcKey string, destKey string) error {
	srcPath := l.getPath(srcKey)
	srcFd, _, err := utils.OpenAsReadOnly(srcPath)
	if err != nil {
		return err
	}
	defer srcFd.Close()

	destPath := l.getPath(destKey)
	dir, _ := filepath.Split(destPath)
	if err = os.MkdirAll(dir, os.ModePerm); err != nil {
		return err
	}
	destFd, err := os.OpenFile(destPath, os.O_CREATE|os.O_RDWR|os.O_TRUNC, os.ModePerm)
	if err != nil {
		if os.IsPermission(err) {
			return storage.FileNoPermissionErr
		}
		return err
	}
	defer destFd.Close()

	_, err = io.Copy(destFd, srcFd)
	if err != nil {
		return err
	}

	return nil
}

func (l *local) Exists(key string) (bool, error) {
	path := l.getPath(key)
	_, err := os.Stat(path)
	if err != nil {
		if os.IsNotExist(err) {
			return false, nil
		}
		if os.IsPermission(err) {
			return false, storage.FileNoPermissionErr
		}
		return false, err
	}

	return true, nil
}

func (l *local) Size(key string) (int64, error) {
	path := l.getPath(key)
	fileInfo, err := os.Stat(path)
	if err != nil {
		if os.IsNotExist(err) {
			return 0, storage.FileNotFoundErr
		}
		if os.IsPermission(err) {
			return 0, storage.FileNoPermissionErr
		}
		return 0, err
	}

	return fileInfo.Size(), nil
}

func (l *local) Delete(key string) error {
	path := l.getPath(key)
	err := os.Remove(path)
	if err != nil {
		if os.IsNotExist(err) {
			return storage.FileNotFoundErr
		}
		if os.IsPermission(err) {
			return storage.FileNoPermissionErr
		}
		return err
	}

	return nil
}

// Url 获取文件访问链接
func (l *local) Url(key string) string {
	return l.config.AppUrl + "/" + utils.NormalizeKey(key)
}
