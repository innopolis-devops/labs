# Monitoring

1. Set up Grafana
2. Run the app with monitoring:
```bash
docker-compose up
```
The app itself opens at [localhost:5000](http://127.0.0.1:5000)
3. Run the query in Grafana at [localhost:3000](http://127.0.0.1:3000)
```bash
{job="docker"} |= `` | json
```
Results:
![image](https://github.com/nailyav/DevOps-labs/blob/lab7/monitoring/assets/Screenshot_1.png)
![image](https://github.com/nailyav/DevOps-labs/lab7/monitoring/assets/Screenshot_2.png)
![image](https://github.com/nailyav/DevOps-labs/lab7/monitoring/assets/Screenshot_3.png)
