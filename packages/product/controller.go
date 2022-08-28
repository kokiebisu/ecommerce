package main

import (
	"github.com/gofiber/fiber/v2"
)

type ProductController struct {
	service *ProductService
}



func (controller *ProductController) getProducts(c *fiber.Ctx) error {
	products := controller.service.retrieveProducts()
	return c.JSON(products)
}

func (controller *ProductController) addProduct(c *fiber.Ctx) error {
	return c.SendString("POST: Hello World")
}
