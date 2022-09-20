package main

import (
	"context"
	"fmt"
	"html/template"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/jessevdk/go-flags"
)

var cfg struct {
	Host string `short:"l" long:"listen" env:"LISTEN" description:"Host to listen on"`
}

const tmplText = `<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>lab1</title>
</head>
<body>
	<h1>lab1</h1>
	<p>{{.}}</p>
</body>
</html>`

var tmpl = template.Must(template.New("").Parse(tmplText))

func main() {
	if _, err := flags.Parse(&cfg); err != nil {
		panic(fmt.Errorf("failed to parse flags: %w", err))
	}

	ctx, stop := signal.NotifyContext(context.Background(), os.Interrupt, syscall.SIGTERM, syscall.SIGINT)
	defer stop()

	srv := &http.Server{
		Addr:    cfg.Host,
		Handler: handler(time.Now),
	}

	go func() {
		log.Printf("[INFO] starting web server on %s", cfg.Host)
		if err := srv.ListenAndServe(); err != nil {
			log.Printf("[WARN] server stopped, reason: %v", err)
		}
	}()

	<-ctx.Done()
	if err := srv.Close(); err != nil {
		log.Printf("[WARN] failed to stop server: %v", err)
	}

}

func handler(now func() time.Time) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		if err := tmpl.Execute(w, now().Format(time.RFC3339Nano)); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}
	})
}
