# Best practices for Python web development

## Application

+ for simple web application, use simple web framework - **Flask**. It's simple, and syncrhonous fast-to-write
+ use wsgi for production, not flask dev server
+ use docker for your application for easy production run
+ use ready .gitignore file from [here](https://github.com/github/gitignore/blob/main/Python.gitignore)
+ use ENV variables to configure your app without rebuilding
+ use simple and fast linter - **Black**
+ use Jinja2 templates, not hard code html code

Also I decided to use [linter](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) for .md files

## Unit test

+ use popular, easy and powerfull framework - **pytest**
+ store tests in `tests/` dir
+ use fixtures, to initiate client instance only once
+ to test app with time, should use mock library to mock `datetime.now()` function - **freezegun**

## Metrics

Default prometheus metrics. Example:

```console
> curl localhost:4444/metrics
# HELP python_gc_objects_collected_total Objects collected during gc
# TYPE python_gc_objects_collected_total counter
python_gc_objects_collected_total{generation="0"} 924.0
python_gc_objects_collected_total{generation="1"} 592.0
python_gc_objects_collected_total{generation="2"} 0.0
# HELP python_gc_objects_uncollectable_total Uncollectable object found during GC
# TYPE python_gc_objects_uncollectable_total counter
python_gc_objects_uncollectable_total{generation="0"} 0.0
python_gc_objects_uncollectable_total{generation="1"} 0.0
python_gc_objects_uncollectable_total{generation="2"} 0.0
# HELP python_gc_collections_total Number of times this generation was collected
# TYPE python_gc_collections_total counter
python_gc_collections_total{generation="0"} 97.0
python_gc_collections_total{generation="1"} 8.0
python_gc_collections_total{generation="2"} 0.0
# HELP python_info Python platform information
# TYPE python_info gauge
python_info{implementation="CPython",major="3",minor="9",patchlevel="11",version="3.9.11"} 1.0
# HELP flask_exporter_info Information about the Prometheus Flask exporter
# TYPE flask_exporter_info gauge
flask_exporter_info{version="0.20.3"} 1.0
# HELP flask_http_request_duration_seconds Flask HTTP request duration in seconds
# TYPE flask_http_request_duration_seconds histogram
flask_http_request_duration_seconds_bucket{le="0.005",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="0.01",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="0.025",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="0.05",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="0.075",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="0.1",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="0.25",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="0.5",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="0.75",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="1.0",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="2.5",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="5.0",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="7.5",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="10.0",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_bucket{le="+Inf",method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_count{method="GET",path="/",status="200"} 1.0
flask_http_request_duration_seconds_sum{method="GET",path="/",status="200"} 0.0034910410000001946
# HELP flask_http_request_duration_seconds_created Flask HTTP request duration in seconds
# TYPE flask_http_request_duration_seconds_created gauge
flask_http_request_duration_seconds_created{method="GET",path="/",status="200"} 1.665324380152885e+09
# HELP flask_http_request_total Total number of HTTP requests
# TYPE flask_http_request_total counter
flask_http_request_total{method="GET",status="200"} 1.0
# HELP flask_http_request_created Total number of HTTP requests
# TYPE flask_http_request_created gauge
flask_http_request_created{method="GET",status="200"} 1.665324380152978e+09
# HELP flask_http_request_exceptions_total Total number of HTTP requests which resulted in an exception
# TYPE flask_http_request_exceptions_total counter
```
