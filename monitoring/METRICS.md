- cd in `monitoring` folder
- Run `docker-compose up`
- Docker
<p float="left">
<img width="600" src="https://user-images.githubusercontent.com/49106163/197655505-90df584f-c886-48ba-a197-9aa35394a9c3.png"/>
</p>
- Let's check that apps are running using `curl` in terminal
`app_python` is on **8000** port. `app_kotlin` is on **8080** port.
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/197655533-a1a53913-8455-48a3-bc8d-4502d6fdf12a.png"/>
</p>

- Check `/metrics`:
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/197713332-57cc0537-2baa-45d2-8af2-111f0c8fb9fa.png"/>
</p>

- Check Targets :
[http://localhost:9090/targets](http://localhost:9090/targets)
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/197655547-dbb77306-a259-407d-a354-7c642b0c4ef7.png"/>
</p>

- Set up **Prometheus 2.0 Overview** dashboard:
[https://grafana.com/grafana/dashboards/3662-prometheus-2-0-overview/](https://grafana.com/grafana/dashboards/3662-prometheus-2-0-overview/)
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/197655560-fbc0d9cc-85a9-495b-b76c-231acac41340.png"/>
</p>
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/197655587-8d8cce3b-7441-4fc0-9843-6197b12f545d.png"/>
</p>
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/197655597-938f4c5a-cabd-43de-b1c3-bb59b22c1dc4.png"/>
</p>
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/197655606-a4af2d8a-8ae3-489c-9775-bc5ab0063413.png"/>
</p>
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/197655619-b526e790-845c-428d-bb48-553b0996ec19.png"/>
</p>
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/197655624-ad1f6868-3906-4156-8019-9f0b9e904a12.png"/>
</p>


- Set up **Loki2.0 Global Metrics** dashboard:
[https://grafana.com/grafana/dashboards/13407-loki2-0-global-metrics/](https://grafana.com/grafana/dashboards/13407-loki2-0-global-metrics/)
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/197655635-1bd4a825-116d-4241-98a2-0a97ec732336.png"/>
</p>
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/197655644-63ac1c16-948b-4907-8349-94f31f27f1b1.png"/>
</p>
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/197655662-80a76128-185f-454d-93d0-d14da9a8dcbb.png"/>
</p>
