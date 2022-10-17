- cd in `monitoring` folder
- Run `docker-compose up`
- Logs in terminal. As can you see two apps are running simultaneously:
`monitoring-app_kotlin-1` and `monitoring-app_python-1`
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/196282513-80452da0-4e55-4330-b005-725f92b92271.png"/>
</p>

- Docker
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/196282862-1f78f920-0472-4100-9a6a-138891d8a2b2.png"/>
</p>

- Let's check that apps are running.
`app_python` is on **8000** port. `app_kotlin` is on **8080** port.
- In Web
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/196283243-466e495f-6574-404d-8238-102de415f8c9.png"/>
</p>

- Using `curl` in terminal
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/196283908-9adc10ce-8719-4fc9-880b-5be314fb7373.png"/>
</p>

- Check Service Discovery:
[http://localhost:9080/service-discovery](http://localhost:9080/service-discovery)
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/196284608-83be9501-df6d-424f-aa39-6918d487aff8.png"/>
</p>

- Check Grafana [http://localhost:3000](http://localhost:3000):
  - **login**: `admin`
  - **password**: `admin`

- Set `container_name`:
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/196286792-33024ed4-10f2-4024-bc95-19d41ae21608.png"/>
</p>

- Ta-dah! Logs itself:
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/196286853-9ee35b15-003f-45a8-a670-2a451bbd96d2.png"/>
</p>

- Create panels for a convenient view:
<p float="left">
<img width="1000" src="https://user-images.githubusercontent.com/49106163/196286908-8e5d1a1e-d7ed-4f46-9148-3cc7c495696a.png"/>
</p>