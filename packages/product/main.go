package main

import (
	"log"

	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()
	registerRoute(app)

	log.Fatal(app.Listen(":80"))
}