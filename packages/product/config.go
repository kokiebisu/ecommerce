package main

type Config struct {
	DB *DBConfig
}

type DBConfig struct {
	Dialect string
	Host string
	Port int
	Username string
	Password string
	Name string
	Charset string
	DatabaseName string
}

func GetConfig() *Config {
	return &Config{
		&DBConfig{
			Dialect: "mysql",
			Host: "0.0.0.0",
			Port: 3306,
			Username: "root",
			Password: "password",
			DatabaseName: "products",
			Name: "products",
			Charset: "utf8",
		},
	}
}