package main

import (
	"log"

	"github.com/gofiber/fiber/v2"
)

type Bootstrap struct {
	app *fiber.App
	controller *ProductController
	config *Config
}

func (bootstrap *Bootstrap) Initialize() {
	bootstrap.config = GetConfig()
	bootstrap.app = fiber.New()
	bootstrap.controller = &ProductController{
		service: GetProductService(bootstrap.config),
	}
	bootstrap.registerRoutes()
}

func (bootstrap *Bootstrap) registerRoutes() {
	if bootstrap.controller == nil {
		log.Fatal("Controller was not properly initialized")
	}
	bootstrap.app.Get("/", bootstrap.controller.GetProducts)
	bootstrap.app.Post("/", bootstrap.controller.AddProduct)
	bootstrap.app.Get("/:productId", bootstrap.controller.GetProduct)
	bootstrap.app.Put("/:productId", bootstrap.controller.UpdateProduct)
	bootstrap.app.Delete("/:productId", bootstrap.controller.DeleteProduct)
}

func (bootstrap *Bootstrap) Run() {
	log.Fatal(bootstrap.app.Listen(":80"))
}