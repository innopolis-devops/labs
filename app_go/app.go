package main

import (
        "fmt"
        "net/http"
        "time"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
        loc, _ := time.LoadLocation("Europe/Moscow")
        now := time.Now().In(loc).String()
        w.Write([]byte(fmt.Sprintf("<h1>Moscow time is %s</h1>", now)))
}

func main() {
        port := "3000"
        mux := http.NewServeMux()
        mux.HandleFunc("/", indexHandler)
        http.ListenAndServe(":"+port, mux)
}