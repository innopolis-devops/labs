# logging part with grafana! 
(idk why exclamation sign is here im not that excited)

## proof of work

#### raw query
```
{container_name="molberte/devops-labs:latest|monitoring-app_python-1"} |= `` | json
```

#### amazing screenshots go here:

running grafana on `http://127.0.0.1:3100` and exploring the query above

![image](https://user-images.githubusercontent.com/63815121/196315599-ac2c1799-5ac8-4175-b54d-272861ca4d38.png)

the query results:

![image](https://user-images.githubusercontent.com/63815121/196315973-b1974965-8550-4689-ad9b-332ef046c76f.png)




## how i managed it to work
god bless my teammates for providing *continious support* to me!!

i used wsl therefore experienced a lil problem with volumes mounting and was needed to perform additional actions:

1. docker logs were found at `\\wsl$\docker-desktop-data\version-pack-data\community\docker`
2. i've added one more drive on windows via `net use l: \\wsl$\docker-desktop-data`

![image](https://user-images.githubusercontent.com/63815121/196316027-31e5e3c1-dcaa-4e7f-8acf-f91315495a3f.png)

3. then mounted it to wsl using 
```
sudo mkdir /mnt/l
sudo mount -t drvfs l: /mnt/l
```
![image](https://user-images.githubusercontent.com/63815121/196316144-302d96c0-012d-4492-8abd-bd950f6df043.png)

and it works!! 


