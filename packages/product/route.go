package main

import "github.com/gofiber/fiber/v2"

func registerRoute(app *fiber.App) {
	controller := &ProductController{}
	app.Get("/", controller.getProducts)
	app.Post("/", controller.addProduct)
}