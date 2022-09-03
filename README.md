# Moscow time web app

The application starts a web server that returns the current time in the time zone ```Europe/Moscow```.

## Python implementatiom

You can find Python implementation [here](app_python/).

### Container building

You can find ```Containerfile``` [here](app_python/Containerfile).

Building via [podman](https://podman.io/): ```podman build -f app_python/Containerfile -t local/moscow_calling:1.0 app_python```

### Running

Running via [podman](https://podman.io/): ```podman run --rm -it local/moscow_calling:1.0```
