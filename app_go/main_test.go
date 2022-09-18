package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
	"time"

	"bou.ke/monkey"
	"github.com/gin-gonic/gin"
)

func TestRightRequest(t *testing.T) {
	gin.SetMode(gin.TestMode)
	patch := monkey.Patch(time.Now, func() time.Time { return time.Date(2022, time.September, 1, 1, 1, 1, 1, time.UTC) })
	defer patch.Unpatch()
	r := CreateServer(time.UTC)
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/", nil)
	r.ServeHTTP(w, req)
	if w.Code != 200 {
		t.Error("Response status is not OK")
	}
	if w.Body.String() != "2022-09-01 01:01:01.000000001 +0000 UTC" {
		t.Error("Incorrect response text")
	}
}

func TestWrongRequest(t *testing.T) {
	gin.SetMode(gin.TestMode)
	r := CreateServer(time.UTC)
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/time", nil)
	r.ServeHTTP(w, req)
	if w.Code != 404 {
		t.Error("Response status is not NotFound")
	}
}