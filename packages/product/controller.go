package main

import (
	"errors"
	"fmt"
	"strconv"

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
	productId := c.Params("productId")
	p := new(Product)

	if err := c.BodyParser(p); err != nil {
		return err
	}
	controller.service.addProduct(*p)
	message := "Add Product: " + productId
	return c.SendString(message)
}

func (controller *ProductController) updateProduct(c *fiber.Ctx) error {
	productId := c.Params("productId")
	p := new(Product)

	if err := c.BodyParser(p); err != nil {
		return err
	}

	if value, err := strconv.Atoi(productId); err == nil {
		controller.service.updateProduct(value, *p)
		return c.SendString("Update Product")
	}
	panic(errors.New("oops"))
}

func (controller *ProductController) deleteProduct(c *fiber.Ctx) error {
	productId := c.Params("productId")

	if value, err := strconv.Atoi(productId); err == nil {
		fmt.Println("entered")
		controller.service.deleteProduct(value)
		return c.SendString("Removed product")
	}

	panic(errors.New("unable to convert"))
}
