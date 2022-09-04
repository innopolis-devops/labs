package main

import (
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	location, err := time.LoadLocation("Europe/Moscow")
	if err != nil {
		log.Fatal(err)
	}
	r.GET("/", func(ctx *gin.Context) {
		in := time.Now().In(location)
		ctx.String(http.StatusOK, in.String())
	})
	log.Fatal(r.Run())
}
