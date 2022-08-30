docker build -t make_your_time -f ./docker/Dockerfile .
docker run -d -p 8000:8000 --rm --name make_your_time make_your_time
