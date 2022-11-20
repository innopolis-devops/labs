package main

import (
        "fmt"
        "net/http"
        "time"
        "github.com/prometheus/client_golang/prometheus/promhttp"
        "os"
        "encoding/json"
        "path/filepath"
        "errors"
)

func getTime(tz string) string{
    loc, _ := time.LoadLocation(tz)
    now := time.Now().In(loc).String()
    return now
}

func indexHandler(visits_path string) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        now := getTime("Europe/Moscow")
        f, _ := os.OpenFile(visits_path, os.O_APPEND|os.O_WRONLY|os.O_CREATE, 0600)
        f.WriteString(now + "\n")
        f.Close()
        _, err := w.Write([]byte(fmt.Sprintf("<h1>Moscow time is %s</h1>", now)))
        if err != nil {
            _ = fmt.Errorf("Some error occured")
        }
    }
}

func visitsHandler(visits_path string) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        f, _ := os.ReadFile(visits_path)
        fmt.Println(string(f))
        w.Write([]byte(string(f)))
    }
}


func main() {
        type Visits struct {
          Path string
        }
        var visits Visits
        config_path := "./config.json"
        fileBytes, _ := os.ReadFile(config_path)
        json.Unmarshal(fileBytes, &visits)
        visits_dir := filepath.Dir(visits.Path)
        os.MkdirAll(visits_dir, os.ModePerm)
        _, err := os.Stat(visits.Path)
        if errors.Is(err, os.ErrNotExist) {
            f, _ := os.Create(visits.Path)
            f.Close()
        }


        port := "2222"

        mux := http.NewServeMux()
        mux.HandleFunc("/", indexHandler(visits.Path))
        mux.HandleFunc("/visits", visitsHandler(visits.Path))
        mux.Handle("/metrics", promhttp.Handler())

        res := http.ListenAndServe(":"+port, mux)
        if res != nil {
            _ = fmt.Errorf("Some error occured")
        }
}