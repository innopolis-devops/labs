FROM haskell:8.10.7

WORKDIR /app

RUN ["addgroup", "-S", "group"]
RUN ["adduser", "-S", "user", "-G", "group"]

USER user

COPY . /app
RUN ["stack", "build"]

EXPOSE 80

CMD ["stack", "exec", "msc-exe"]
