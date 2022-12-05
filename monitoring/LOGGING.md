# Logging using Grafana

 1) Let's run our docker-compose.yml file to create needed containers
 ![img.png](screenshots/img.png)
As we can see, all containers started up successfully.


 2) Now let's check that application is accessible.
 ![img_1.png](screenshots/img_1.png)![img_2.png](screenshots/img_2.png)


 3) Now, when our application is running, promtail container will read logs from the python app, send it to loki. In the same time grafana will take this logs from loki and show them to us.


 4) Let's check that grafana and promtail works correctly.(default login/password for grafana is admin/admin)
![img_3.png](screenshots/img_3.png)
![img_4.png](screenshots/img_4.png)
![img_5.png](screenshots/img_5.png)
