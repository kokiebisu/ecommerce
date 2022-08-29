package main

import (
	"database/sql"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

type ProductRepository struct {
	pool *sql.DB
}

func GetProductRepository(config *Config) *ProductRepository {
	return &ProductRepository{
		pool: GetPool(config),
	}
}


func (r *ProductRepository) FindMany() []Product {
	sqlStatement := "SELECT * FROM product"
	products := []Product{}
	results, err := r.pool.Query(sqlStatement);
	if err != nil {
		panic(err.Error())
	}
	for results.Next() {
		product := &Product{}
		err = results.Scan(&product.Id, &product.Name)
		if err != nil {
			log.Fatal(err)
		}
		products = append(products, *product)
	}
	return products
}

func (r *ProductRepository) FindOne(productId int) Product {
	product := &Product{}
	sqlStatement := `SELECT * FROM product WHERE id = ?;`
	row := r.pool.QueryRow(sqlStatement, productId)
	err := row.Scan(&product.Id, &product.Name)
	if err != nil {
		log.Fatal(err)
	}
	return *product
}

func (r *ProductRepository) Create(name string) (int64, error) {
	sqlStatement := `INSERT INTO product (name) VALUES (?)`
	res, err := r.pool.Exec(sqlStatement, name)

	if err !=  nil {
		log.Fatal(err)
	}

	lastId, err := res.LastInsertId()

	if err != nil {
		log.Fatal(err)
	}
	
	return lastId, nil
}

func (r *ProductRepository) Update(productId int, product Product) (int64, error) {
	sqlStatement := "UPDATE product SET name = ? WHERE id = ?"
	res, err := r.pool.Exec(sqlStatement, product.Name, productId)

	if err !=  nil {
		log.Fatal(err)
	}

	lastId, err := res.LastInsertId()

	if err != nil {
		log.Fatal(err)
	}
	
	return lastId, nil
}

func (r *ProductRepository) Delete(productId int) (int64, error) {
	sqlStatement := "DELETE FROM product where id = ?"
	res, err := r.pool.Exec(sqlStatement, productId)

	if err !=  nil {
		log.Fatal(err)
	}

	lastId, err := res.LastInsertId()

	if err != nil {
		log.Fatal(err)
	}
	
	return lastId, nil
}