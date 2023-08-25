package fileDriver

type LocalConfig struct {
	RootDir string `mapstructure:"root_dir" json:"root_dir" yaml:"root_dir"`
	AppUrl  string `mapstructure:"app_url" json:"app_url" yaml:"app_url"`
}
