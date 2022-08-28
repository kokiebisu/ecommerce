package main

import (
	"errors"
	"strconv"

	"github.com/gofiber/fiber/v2"
)

type ProductController struct {
	service *ProductService
}

func (controller *ProductController) GetProducts(c *fiber.Ctx) error {
	products := controller.service.RetrieveProducts()
	return c.JSON(products)
}

func (controller *ProductController) GetProduct(c *fiber.Ctx) error {
	productId := c.Params("productId")

	id, err := strconv.Atoi(productId); 
	
	if err != nil {
		c.SendString("Something went wrong")
	}

	product := controller.service.RetrieveProduct(id)
	return c.JSON(product)
}

func (controller *ProductController) AddProduct(c *fiber.Ctx) error {
	product := new(Product)

	if err := c.BodyParser(product); err != nil {
		return err
	}
	controller.service.AddProduct(product.Name)
	return c.SendString("Added product")
}

func (controller *ProductController) UpdateProduct(c *fiber.Ctx) error {
	productId := c.Params("productId")
	product := new(Product)

	if err := c.BodyParser(product); err != nil {
		return err
	}

	if id, err := strconv.Atoi(productId); err == nil {
		controller.service.UpdateProduct(id, *product)
		return c.SendString("Update Product")
	}
	panic(errors.New("oops"))
}

func (controller *ProductController) DeleteProduct(c *fiber.Ctx) error {
	productId := c.Params("productId")

	if id, err := strconv.Atoi(productId); err == nil {
		controller.service.DeleteProduct(id)
		return c.SendString("Removed product")
	}

	panic(errors.New("unable to convert"))
}
