package main

import "github.com/gofiber/fiber/v2"

type ProductController struct {}

func (controller *ProductController) getProducts(c *fiber.Ctx) error {
	return c.SendString("GET: Hello World")
}

func (controller *ProductController) addProduct(c *fiber.Ctx) error {
	return c.SendString("POST: Hello World")
}
