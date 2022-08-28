package main

import "errors"

type ProductRepository struct {
	products []Product
}

func (r *ProductRepository) findOne(productId int) (*Product, error) {
	for _, item := range r.products {
		if item.Id == productId {
			return &item, nil
		}
	}
	return nil, errors.New("cannot find the product based on the provided productId")
}

func (r *ProductRepository) findMany() []Product {
	return r.products
}

func (r *ProductRepository) create(product Product) (*Product, error) {
	r.products = append(r.products, product)
	return &product, nil
}

func (r *ProductRepository) delete(productId int) (*Product, error) {
	for i, item := range r.products {
		if item.Id == productId {
			r.products = append(r.products[:i], r.products[:i+1]...)
			return &item, nil
		}
	}
	return nil, errors.New("cannot find the product based on the provided productId")
}