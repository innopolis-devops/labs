package main

import (
        "fmt"
        "net/http"
        "time"
        "github.com/prometheus/client_golang/prometheus/promhttp"
)

func getTime(tz string) string{
    loc, _ := time.LoadLocation(tz)
    now := time.Now().In(loc).String()
    return now
}

func indexHandler(w http.ResponseWriter, r *http.Request) {
        now := getTime("Europe/Moscow")
        _, err := w.Write([]byte(fmt.Sprintf("<h1>Moscow time is %s</h1>", now)))
        if err != nil {
            _ = fmt.Errorf("Some error occured")
        }
}

func main() {
        port := "2222"
        mux := http.NewServeMux()
        mux.HandleFunc("/", indexHandler)
        mux.Handle("/metrics", promhttp.Handler())
        res := http.ListenAndServe(":"+port, mux)
        if res != nil {
            _ = fmt.Errorf("Some error occured")
        }
}