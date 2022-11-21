package main

import (
	"fmt"
	"net/http"
	"os"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

var requestsCounter = prometheus.NewCounter(
   prometheus.CounterOpts{
       Name: "app_go_request_count",
       Help: "No of request handled",
   },
)

func prometheusHandler() gin.HandlerFunc {
	h := promhttp.Handler()

	return func(c *gin.Context) {
		h.ServeHTTP(c.Writer, c.Request)
	}
}

func SetUpRouter() *gin.Engine{
	router := gin.Default()
	loc := time.FixedZone("MSK", 3*60*60)
	router.GET("/", func(c *gin.Context) {
		f, err := os.OpenFile("history.txt", os.O_APPEND|os.O_WRONLY|os.O_CREATE, 0600)
		if err != nil {
			panic(err)
		}

		defer func(f *os.File) {
			_ = f.Close()
		}(f)

		curTime := time.Now().In(loc).String()

		if _, err = f.WriteString(curTime + " " + c.ClientIP() + "\n"); err != nil {
			panic(err)
		}
	    requestsCounter.Inc()
		c.String(http.StatusOK, curTime)
	})
	router.GET("/visits", func(context *gin.Context) {
		context.File("history.txt")
	})
	return router
}

func main() {
	gin.SetMode(gin.ReleaseMode)
	prometheus.MustRegister(requestsCounter)
	router := SetUpRouter()
	router.GET("/metrics", prometheusHandler())
	err := router.Run("0.0.0.0:8080")
	if err != nil {
		_ = fmt.Errorf("unexpected error")
		return
	}
}
