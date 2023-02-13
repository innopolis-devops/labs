![Prometheus](/monitoring/images/4.png)

## Improvements to the docker-compose.yml
- Added log rotations using
```
max-size: 20m
max-file: 5
```
- Added memory limits to the services
- Added healthchecks to the services

Also, I'm gathering metrics from services in the ```docker-compose.yml``` file