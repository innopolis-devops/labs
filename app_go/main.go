package main

import (
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

func main() {
	location, err := time.LoadLocation("Europe/Moscow")
	if err != nil {
		panic(err)
	}
	r := CreateServer(location)
	log.Fatal(r.Run())
}

func prometheusHandler() gin.HandlerFunc {
    h := promhttp.Handler()

    return func(c *gin.Context) {
        h.ServeHTTP(c.Writer, c.Request)
    }
}

func CreateServer(location *time.Location) *gin.Engine {
	r := gin.Default()
	r.GET("/", func(ctx *gin.Context) {
		in := time.Now().In(location)
		ctx.String(http.StatusOK, in.String())
	})
	r.GET("/metrics", prometheusHandler())
	return r
}