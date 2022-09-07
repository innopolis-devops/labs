# Docker best practices

* Not using wildcard copy `COPY . ./` to avoid unnecesary inlcusion of secrets or just redundant data.
* Using `CMD` as default arguments for `ENTRYPOINT` for running the server. This also allows to change bind address without having to rebuild the image.