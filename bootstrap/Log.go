package bootstrap

import (
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
	"gopkg.in/natefinch/lumberjack.v2"
	"online-practice-system/config"
	"online-practice-system/global"
	"online-practice-system/utils"
	"os"
	"time"
)

var (
	level   zapcore.Level // zap 日志等级
	options []zap.Option  // zap 配置项
)

// 初始化zag日志
func InitializeLog() *zap.Logger {
	zagConfig := global.App.Config.Log
	// 创建根目录
	createRootDir(zagConfig)

	// 设置日志等级
	setLogLevel(zagConfig)

	if zagConfig.ShowLine {
		options = append(options, zap.AddCaller())
	}

	// 初始化 zap
	return zap.New(getZapCore(zagConfig), options...)
}

func createRootDir(config config.Log) {
	if ok, _ := utils.PathExists(config.RootDir); !ok {
		_ = os.Mkdir(config.RootDir, os.ModePerm)
	}
}

func setLogLevel(config config.Log) {
	switch config.Level {
	case "debug":
		level = zap.DebugLevel
		options = append(options, zap.AddStacktrace(level))
	case "info":
		level = zap.InfoLevel
	case "warn":
		level = zap.WarnLevel
	case "error":
		level = zap.ErrorLevel
		options = append(options, zap.AddStacktrace(level))
	case "dpanic":
		level = zap.DPanicLevel
	case "panic":
		level = zap.PanicLevel
	case "fatal":
		level = zap.FatalLevel
	default:
		level = zap.InfoLevel
	}
}

// 扩展 Zap
func getZapCore(config config.Log) zapcore.Core {
	var encoder zapcore.Encoder

	// 调整编码器默认配置
	encoderConfig := zap.NewProductionEncoderConfig()
	encoderConfig.EncodeTime = func(time time.Time, encoder zapcore.PrimitiveArrayEncoder) {
		encoder.AppendString(time.Format("[" + "2006-01-02 15:04:05.000" + "]"))
	}
	encoderConfig.EncodeLevel = func(l zapcore.Level, encoder zapcore.PrimitiveArrayEncoder) {
		encoder.AppendString(global.App.Config.App.Env + "." + l.String())
	}

	// 设置编码器
	if global.App.Config.Log.Format == "json" {
		encoder = zapcore.NewJSONEncoder(encoderConfig)
	} else {
		encoder = zapcore.NewConsoleEncoder(encoderConfig)
	}

	// 设置日志写入器,使用 lumberjack 作为日志写入器
	file := &lumberjack.Logger{
		Filename:   config.RootDir + "/" + config.Filename,
		MaxSize:    config.MaxSize,
		MaxBackups: config.MaxBackups,
		MaxAge:     config.MaxAge,
		Compress:   config.Compress,
	}
	fileSyncer := zapcore.AddSync(file)
	// 创建多个写入器，包括文件和控制台
	writeSyncer := zapcore.NewMultiWriteSyncer(fileSyncer, zapcore.AddSync(os.Stdout))
	// 创建核心
	core := zapcore.NewCore(encoder, writeSyncer, level)
	return core
}
