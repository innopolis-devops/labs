package main

import (
	"fmt"
	"net/http"
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
	prometheus.MustRegister(requestsCounter)
	loc := time.FixedZone("MSK", 3*60*60)
	router.GET("/", func(c *gin.Context) {
	    requestsCounter.Inc()
		c.String(http.StatusOK, time.Now().In(loc).String())
	})
	router.GET("/metrics", prometheusHandler())
	return router
}

func main() {
	gin.SetMode(gin.ReleaseMode)
	router := SetUpRouter()
	err := router.Run("0.0.0.0:8080")
	if err != nil {
		_ = fmt.Errorf("unexpected error")
		return
	}
}
