package main

import (
	"log"
	"net/http"
	"os"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

func main() {
	location, err := time.LoadLocation("Europe/Moscow")
	if err != nil {
		panic(err)
	}
	r := createServer(location)
	log.Fatal(r.Run())
}

func prometheusHandler() gin.HandlerFunc {
	h := promhttp.Handler()

	return func(c *gin.Context) {
		h.ServeHTTP(c.Writer, c.Request)
	}
}

func getLogFileName() string {
	fileName := os.Getenv("LOG_FILE")
	if fileName == "" {
		fileName = "data/visits.log"
	}
	return fileName
}

func writeVisitsMiddleware(ctx *gin.Context) {
	fileName := getLogFileName()
	f, err := os.OpenFile(fileName, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Println(err)
		ctx.AbortWithStatus(http.StatusInternalServerError)
		return
	}
	defer f.Close()
	if _, err = f.WriteString(ctx.ClientIP() + "\n"); err != nil {
		log.Println(err)
		ctx.AbortWithStatus(http.StatusInternalServerError)
		return
	}
	ctx.Next()
}

func getVisits() (string, error) {
	fileName := getLogFileName()
	b, err := os.ReadFile(fileName)
	if err != nil {
		return "", err
	}
	return string(b), nil
}

func createServer(location *time.Location) *gin.Engine {
	r := gin.Default()
	r.GET("/", writeVisitsMiddleware, func(ctx *gin.Context) {
		in := time.Now().In(location)
		ctx.String(http.StatusOK, in.String())
	})
	r.GET("/visits", func(ctx *gin.Context) {
		visits, err := getVisits()
		if err != nil {
			log.Println(err)
			ctx.AbortWithStatus(http.StatusInternalServerError)
			return
		}
		ctx.String(http.StatusOK, visits)
	})
	r.GET("/metrics", prometheusHandler())
	return r
}
