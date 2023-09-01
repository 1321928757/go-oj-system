package config

type Captcha struct {
	EmailNumber   int `mapstructure:"email_number" yaml:"email_number"`
	FigureNumber  int `mapstructure:"figure_number" yaml:"figure_number"`
	EmailTimeout  int `mapstructure:"email_timeout" yaml:"email_timeout"`
	FigureTimeout int `mapstructure:"figure_timeout" yaml:"figure_timeout"`
}
