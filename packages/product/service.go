package main

type ProductService struct {
	products []Product
}

func (s *ProductService) retrieveProducts() []Product {
	return s.products
}

func (s *ProductService) retrieveProduct(id int) *Product {
	for _, item := range s.products {
		if item.id == id {
			return &item
		}
	}
	return nil
}
