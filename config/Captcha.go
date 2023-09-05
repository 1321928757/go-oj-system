package config

import "time"

type Captcha struct {
	EmailNumber   int           `mapstructure:"email_number" yaml:"email_number"`
	FigureNumber  int           `mapstructure:"figure_number" yaml:"figure_number"`
	EmailTimeout  time.Duration `mapstructure:"email_timeout" yaml:"email_timeout"`
	FigureTimeout time.Duration `mapstructure:"figure_timeout" yaml:"figure_timeout"`
}
