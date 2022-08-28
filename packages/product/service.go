package main

type ProductService struct {
	repository *ProductRepository
}

func (s *ProductService) retrieveProducts() []Product {
	return s.repository.findMany()
}

func (s *ProductService) retrieveProduct(id int) Product  {
	product, _ := s.repository.findOne(id)
	return *product
}

func (s *ProductService) addProduct(product Product) bool {
	s.repository.create(product)
	return true
}
