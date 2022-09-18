package main

import (
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

func main() {
	location, err := time.LoadLocation("Europe/Moscow")
	if err != nil {
		panic(err)
	}
	r := CreateServer(location)
	log.Fatal(r.Run())
}

func CreateServer(location *time.Location) *gin.Engine {
	r := gin.Default()
	r.GET("/", func(ctx *gin.Context) {
		in := time.Now().In(location)
		ctx.String(http.StatusOK, in.String())
	})
	return r
}