package main

import (
	"net/http"
	"os"
	"time"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {

	dt := time.Now().Format(time.UnixDate)
	response := "<h1>" + dt + "</h1>"

	w.Write([]byte(response))
}

func main() {
	os.Setenv("TZ", "Europe/Moscow")
	port := os.Getenv("PORT")
	if port == "" {
		port = "8000"
	}

	mux := http.NewServeMux()

	mux.HandleFunc("/", indexHandler)
	http.ListenAndServe(":"+port, mux)
}
