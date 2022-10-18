# logging part with grafana! 
(idk why exclamation sign is here im not that excited)

## proof of work

#### raw query
```
{container_name="molberte/devops-labs:latest|monitoring-app_python-1"} |= `` | json
```

#### amazing screenshots go here:




## how i managed it to work
god bless my teammates for providing *continious support* to me!!

i used wsl therefore experienced a lil problem with volumes mounting and was needed to perform additional actions:

1. docker logs were found at `\\wsl$\docker-desktop-data\version-pack-data\community\docker`
2. i've added one more drive on windows

3. then mounted it to wsl using:


