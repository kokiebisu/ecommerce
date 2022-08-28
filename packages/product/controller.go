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
	p := new(Product)

	if err := c.BodyParser(p); err != nil {
		return err
	}
	controller.service.addProduct(*p)
	return c.SendString("Add Product")
}

func (controller *ProductController) updateProduct(c *fiber.Ctx) error {
	return c.SendString("Update Product")
}