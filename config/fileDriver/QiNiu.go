package fileDriver

type QiNiuConfig struct {
	AccessKey string `mapstructure:"access_key" json:"access_key" yaml:"access_key"`
	Bucket    string `mapstructure:"bucket" json:"bucket" yaml:"bucket"`
	Domain    string `mapstructure:"domain" json:"domain" yaml:"domain"`
	SecretKey string `mapstructure:"secret_key" json:"secret_key" yaml:"secret_key"`
	IsSsl     bool   `mapstructure:"is_ssl" json:"is_ssl" yaml:"is_ssl"`
	IsPrivate bool   `mapstructure:"is_private" json:"is_private" yaml:"is_private"`
}
