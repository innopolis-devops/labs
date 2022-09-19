package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestMainPage(t *testing.T) {
	r := SetUpRouter()
	req, _ := http.NewRequest("GET", "/", nil)
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)
	if w.Code != http.StatusOK {
		t.Fail()
	}
}

func TestMissingPage(t *testing.T) {
	r := SetUpRouter()
	req, _ := http.NewRequest("GET", "/missing/page", nil)
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)
	if w.Code != http.StatusNotFound {
		t.Fail()
	}
}