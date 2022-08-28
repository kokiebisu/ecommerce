package main

func configureService() *ProductService {
	repository := &ProductRepository{
		products: []Product{
			{
				Id: 1,
				Name: "Product 1",
			},
		},
	}

	service := &ProductService{
		repository: repository,
	}

	return service
}