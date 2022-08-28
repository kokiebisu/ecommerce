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

func (s *ProductService) updateProduct(productId int, product Product) bool {
	s.repository.update(productId, product)
	return true
}

func (s *ProductService) deleteProduct(productId int) bool {
	s.repository.delete(productId)
	return true
}