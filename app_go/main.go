package main

import (
	"fmt"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

func main() {
	gin.SetMode(gin.ReleaseMode)
	router := gin.Default()
	loc, _ := time.LoadLocation("Europe/Moscow")
	router.GET("/", func(c *gin.Context) {
		c.String(http.StatusOK, time.Now().In(loc).String())
	})
	err := router.Run(":8080")
	if err != nil {
		_ = fmt.Errorf("unexpected error")
		return
	}
}
