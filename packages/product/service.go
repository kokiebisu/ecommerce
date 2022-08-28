package main

type ProductService struct {
	repository *ProductRepository
}


func GetProductService(config *Config) *ProductService {
	return &ProductService{
		repository: GetProductRepository(config),
	}
}

func (s *ProductService) RetrieveProducts() []Product {
	return s.repository.FindMany()
}

func (s *ProductService) RetrieveProduct(id int) Product  {
	return s.repository.FindOne(id)
}

func (s *ProductService) AddProduct(name string) bool {
	s.repository.Create(name)
	return true
}

func (s *ProductService) UpdateProduct(productId int, product Product) bool {
	s.repository.Update(productId, product)
	return true
}

func (s *ProductService) DeleteProduct(productId int) bool {
	s.repository.Delete(productId)
	return true
}