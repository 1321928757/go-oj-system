package fileDriver

type CosConfig struct {
	SecretId  string `mapstructure:"secret_id" json:"secret_id" yaml:"secret_id"`
	SecretKey string `mapstructure:"secret_key" json:"secret_key" yaml:"secret_key"`
	Bucket    string `mapstructure:"bucket" json:"bucket" yaml:"bucket"`
	Domain    string `mapstructure:"domain" json:"domain" yaml:"domain"`
	IsSsl     bool   `mapstructure:"is_ssl" json:"is_ssl" yaml:"is_ssl"`
	IsPrivate bool   `mapstructure:"is_private" json:"is_private" yaml:"is_private"`
}
