package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

func GetPool(config *Config) *sql.DB {
	if db == nil {
		db = configureDB(config)
	}
	return db
}

func configureDB(config *Config) *sql.DB {
	connectionString := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=%s&parseTime=True", 
		config.DB.Username,
		config.DB.Password,
		config.DB.Host,
		config.DB.Port,
		config.DB.DatabaseName,
		config.DB.Charset,
	)
	db, err := sql.Open("mysql", connectionString)
	if err != nil {
		log.Fatal(err)
	}

	pingErr := db.Ping()
    if pingErr != nil {
        log.Fatal(pingErr)
    }
	log.Print("Connected!")
	return db
}
