package config

/*
配置文件的各种配置
结构体中 mapstructure 标签需对应 config.ymal 中的配置名称，
viper 会根据标签 value 值把 config.yaml 的数据赋予给结构体
*/
type Configuration struct {
	App      App      `mapstructure:"app" json:"app" yaml:"app"`
	Log      Log      `mapstructure:"log" json:"log" yaml:"log"`
	Database Database `mapstructure:"database" json:"database" yaml:"database"`
	Jwt      Jwt      `mapstructure:"jwt" json:"jwt" yaml:"jwt"`
	Redis    Redis    `mapstructure:"redis" json:"redis" yaml:"redis"`
	Storage  Storage  `mapstructure:"storage" json:"storage" yaml:"storage"`
}
