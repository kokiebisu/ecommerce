package main

import "github.com/gofiber/fiber/v2"

func registerRoute(app *fiber.App) {
	service := configureService()
	controller := &ProductController{
		service: service,
	}
	app.Get("/", controller.getProducts)
	app.Post("/", controller.addProduct)
}