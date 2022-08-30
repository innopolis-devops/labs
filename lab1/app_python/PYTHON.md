# disclaimer
since I'm not a Python developer, but a Go developer, I can't provide good 
enough list of practices, frameworks and other fancy stuff (well, actually, it
seems kinda impossible to provide any list that would be good enough)

# lab 1 content
I'll just
stop on several *known* frameworks and libraries:
- django
- flask
- sqlalchemy
- ...

about practices:
- which one? devops practices, development practices?


I know several patterns and techniques in service engineering, like:
- service mesh
- feature deployment
- distributed logs
- distributed tracing (opentelemetry, jaeger, zipkin, etc)
- continuous deployment/continuous integration

I'd like to provide some simple examples of CI:
- https://github.com/Semior001/semior001.github.io/blob/master/.github/workflows/.build.yml

It builds hugo website, pushes it to ghcr, pings a webhook on the remote server that initiates a sequence of actions:
- pulls a latest image from ghcr
- downs the running container of the image
- runs the container with that image
