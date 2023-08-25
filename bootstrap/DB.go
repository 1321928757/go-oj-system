package bootstrap

import (
	"go.uber.org/zap"
	"gopkg.in/natefinch/lumberjack.v2"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"io"
	"log"
	"online-practice-system/global"
	model2 "online-practice-system/model"
	"os"
	"strconv"
	"time"
)

func InitializeDB() *gorm.DB {
	// 根据驱动配置进行初始化
	switch global.App.Config.Database.Driver {
	case "mysql":
		return initMySqlGorm()
	default:
		return initMySqlGorm()
	}
}

// 初始化 mysql gorm.DB
func initMySqlGorm() *gorm.DB {
	dbConfig := global.App.Config.Database

	if dbConfig.Database == "" {
		return nil
	}
	dsn := dbConfig.UserName + ":" + dbConfig.Password + "@tcp(" + dbConfig.Host + ":" + strconv.Itoa(dbConfig.Port) + ")/" +
		dbConfig.Database + "?charset=" + dbConfig.Charset + "&parseTime=True&loc=Local"
	mysqlConfig := mysql.Config{
		DSN:                       dsn,   // DSN data source name
		DefaultStringSize:         255,   // string 类型字段的默认长度
		DisableDatetimePrecision:  true,  // 禁用 datetime 精度，MySQL 5.6 之前的数据库不支持
		DontSupportRenameIndex:    true,  // 重命名索引时采用删除并新建的方式，MySQL 5.7 之前的数据库和 MariaDB 不支持重命名索引
		DontSupportRenameColumn:   true,  // 用 `change` 重命名列，MySQL 8 之前的数据库和 MariaDB 不支持重命名列
		SkipInitializeWithVersion: false, // 根据版本自动配置
	}
	gormConfig := &gorm.Config{
		DisableForeignKeyConstraintWhenMigrating: true,
		Logger:                                   getGormLogger(), // 添加gorm logger配置
	}
	if db, err := gorm.Open(mysql.New(mysqlConfig), gormConfig); err != nil {
		global.App.Log.Error("mysql connect failed, err:", zap.Any("err", err))
		return nil
	} else {
		global.App.Log.Info("mysql数据库连接成功~~~~~")
		sqlDB, _ := db.DB()
		sqlDB.SetMaxIdleConns(dbConfig.MaxIdleConns)
		sqlDB.SetMaxOpenConns(dbConfig.MaxOpenConns)
		//数据库表结构同步
		initMySqlTables(db)
		return db
	}
}

/*
数据库表结构同步,该方法只会增加新的字段或修改字段，不会删除字段,
AutoMigrate 方法会尝试自动更改表结构，以使其与结构体定义保持一致
*/
func initMySqlTables(db *gorm.DB) {
	err := db.AutoMigrate(
		//model.ProblemBasic{},
		model2.User{},
		model2.Media{},
	)
	if err != nil {
		global.App.Log.Error("migrate table failed", zap.Any("err", err))
		// 退出程序
		os.Exit(0)
	}
}

func getGormLogger() logger.Interface {
	var logMode logger.LogLevel

	switch global.App.Config.Database.LogMode {
	case "silent":
		logMode = logger.Silent
	case "error":
		logMode = logger.Error
	case "warn":
		logMode = logger.Warn
	case "info":
		logMode = logger.Info
	default:
		logMode = logger.Info
	}

	return logger.New(getGormLogWriter(), logger.Config{
		SlowThreshold:             200 * time.Millisecond,                          // 慢 SQL 阈值
		LogLevel:                  logMode,                                         // 日志级别
		IgnoreRecordNotFoundError: false,                                           // 忽略ErrRecordNotFound（记录未找到）错误
		Colorful:                  !global.App.Config.Database.EnableFileLogWriter, // 禁用彩色打印
	})
}

/*
自定义 gorm Writer,gorm 有一个默认的 logger ，
由于日志内容是输出到控制台的，我们需要自定义一个写入器，
将默认logger.Writer 接口的实现切换为自定义的写入器，这样就可以将日志输出到文件中了。
*/
func getGormLogWriter() logger.Writer {
	var writer io.Writer

	// 是否启用日志文件
	if global.App.Config.Database.EnableFileLogWriter {
		//自定义同时输出到控制台和文件的writer
		writer = io.MultiWriter(os.Stdout, &lumberjack.Logger{
			Filename:   global.App.Config.Log.RootDir + "/" + global.App.Config.Database.LogFilename,
			MaxSize:    global.App.Config.Log.MaxSize,
			MaxBackups: global.App.Config.Log.MaxBackups,
			MaxAge:     global.App.Config.Log.MaxAge,
			Compress:   global.App.Config.Log.Compress,
		})
	} else {
		// 默认 Writer,只会输出到控制台
		writer = os.Stdout
	}
	return log.New(writer, "\r\n", log.LstdFlags)
}
