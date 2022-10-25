1. I've configured prometheus to gather metrics from each service:
![img_5.png](img_5.png)

2. After that I've added prometheus as datasource and setup two dashboards:
![img_7.png](img_7.png)
![img_8.png](img_8.png)

3. Logs rotation and health checks are working.
![img_6.png](img_6.png)

4. Also, I use `prometheus_fastapi_instrumentator` (https://github.com/trallnag/prometheus-fastapi-instrumentator) to 
produce metrics from my app. Now I can set up a dashboard:
![img_9.png](img_9.png)
