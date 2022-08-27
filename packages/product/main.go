package main

import (
	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()
	controller := &ProductController{}
	app.Get("/", controller.getProducts)

	app.Listen(":80")
}