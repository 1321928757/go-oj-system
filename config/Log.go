package config

type Log struct {
	Level      string `mapstructure:"level" yaml:"level"`
	RootDir    string `mapstructure:"root_dir" yaml:"root_dir"`
	Filename   string `mapstructure:"filename" yaml:"filename"`
	Format     string `mapstructure:"format" yaml:"format"`
	ShowLine   bool   `mapstructure:"show_line" yaml:"show_line"`
	MaxBackups int    `mapstructure:"max_backups" yaml:"max_backups"`
	MaxSize    int    `mapstructure:"max_size" yaml:"max_size"` // MB
	MaxAge     int    `mapstructure:"max_age" yaml:"max_age"`   // day
	Compress   bool   `mapstructure:"compress" yaml:"compress"`
}
