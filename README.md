# Docker for ByteMatrix
Docker install script for ByteMatrix

## How to install

1. Install docker.

   a. [AWS](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html#install_docker)

   b. [Mac or Windows](https://www.docker.com/get-started)

2. Download docker-compose.yml

```
wget -O docker-compose.yml https://raw.githubusercontent.com/bytematrix-io/docker/master/docker-compose.yml
```

default port of **ByteMatrix Viewer**(Web Application) is 8080.
If you want to change port to 80, edit **docker-compose.yml** like below.
```
services :
  bm-viewer :
    ports          :
      - "80:8080"
```

default port of **ByteMatrix DB** is 3306.
If you want to change port to another (for example, 3307), edit **docker-compose.yml** like below.
```
services :
  bm-viewer :
    ports          :
      - "3307:3306"
```

This port is used for **Bytematrix Crawler**.

3. Install ByteMatrix

```
sudo docker-compose up -d
```

## How to maintain

1. Update Application

**ByteMatrix DB** contains analysis result so it should be preserved.

Usually, **ByteMatrix Viewer** will be changed frequently. so you can update it like below.

a. pull newer images
```
sudo docker-compose pull bm-viewer
```

b. restart application
```
sudo docker-compose up -d --force-recreate --no-deps bm-viewer
```

2. Check Application log

**ByteMatrix Viewer** log file is stacked in docker container. so you can check it like below.

a. connect to **ByteMatrix Viewer** container.
```
sudo docker exec -it bm-viewer /bin/bash
```

b. tail log.
```
tail -f /app/viewer/log/*.log
```


