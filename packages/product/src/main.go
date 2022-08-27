package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	fmt.Println("Server listening at port 8080...")

	http.HandleFunc("/product", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "hello")
	})

	if err := http.ListenAndServe(":80", nil); err != nil {
		log.Fatal(err)
	}
}