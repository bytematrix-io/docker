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

default port is 8080.
If you want to change port to 80, edit **docker-compose.yml** like below.
```
services :
  bm-viewer :
    ports          :
      - "80:8080"
```

3. Install ByteMatrix

```
docker-compose up -d
```

