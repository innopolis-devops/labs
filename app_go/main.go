package main

import (
	"fmt"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

func SetUpRouter() *gin.Engine{
	router := gin.Default()
	loc := time.FixedZone("MSK", 3*60*60)
	router.GET("/", func(c *gin.Context) {
		c.String(http.StatusOK, time.Now().In(loc).String())
	})
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
