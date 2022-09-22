from os import cpu_count

bind = "0.0.0.0:8000"
workers = cpu_count()
worker_class = "uvicorn.workers.UvicornWorker"

max_requests = 10000
max_requests_jitter = 1000

keepalive = 5
