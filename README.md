# ByteMatrix for Docker
Docker install guide for ByteMatrix

## Getting Started

1. Install docker.

    a. [AWS](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html#install_docker)

    b. [Mac or Windows](https://www.docker.com/get-started)

2. Install ByteMatrix

    a. Get script **docker-compose.yml**
  
    ```bash
    wget -O docker-compose.yml https://raw.githubusercontent.com/bytematrix-io/docker/master/docker-compose.yml
    ```  
   
    b. Install ByteMatrix docker container.

    ```bash
    docker-compose up -d
    ```

    c. Check out docker container up to normally.

    ```bash
    docker ps -a
    ```
 
    ```
    CONTAINER ID        IMAGE                COMMAND                  CREATED             STATUS     PORTS                    NAMES
    bf539d160701        bytematrix/viewer    "/bin/sh -c 'java -j…"   2 hours ago        ...        0.0.0.0:8080->8080/tcp   bm-viewer
    817ce3ede4f3        bytematrix/mariadb   "docker-entrypoint.s…"   2 hours ago        ...        0.0.0.0:3306->3306/tcp   bm-db
    ```

3. Execute Crawler

   a. Send email to [contact@bytematrix.io](mailto:contact@bytematrix.io) and get **license.cert** file. <br>
      ByteMatrix provides free license long enough to analyze your application for 2 months.
      
   b. Put **license.cert** file into a directory.
   
   c. Get script

       - Linux / Mac

        ```bash
        wget -O run.bat https://raw.githubusercontent.com/bytematrix-io/docker/master/executor/crawler/run.sh
        ```

       - Windows

        ```bash
        wget -O run.bat https://raw.githubusercontent.com/bytematrix-io/docker/master/executor/crawler/run.bat
        ```       

   4. Execute crawler. 
      
      **show** command runs without error only if ByteMatrix DB connected properly and license is valid.
      
       - Linux / Mac

        ```bash
        ./run.sh -show
        ```

       - Windows

        ```bash
        .\run.bat -show
        ```
   
## How to maintain

1. Update Application

    a. Pull newer images
    ```bash
    sudo docker-compose pull
    docker pull bytematrix/crawler
    ```

    b. Restart container
    ```bash
    sudo docker-compose up -d --force-recreate --no-deps bm-viewer
    ```

2. Check Application log

    **ByteMatrix Viewer** log file is stacked in docker container. so you can check it like below.

    a. Connect to **ByteMatrix Viewer** container.
    ```bash
    sudo docker exec -it bm-viewer /bin/bash
    ```

    b. tail log.
    ```bash
    tail -f /app/viewer/log/*.log
    ```

## Control memory limitation

Docker limit memory to 2048 kb in default.

If **ByteMatrix Cralwer** needs more memory, you should limit off docker memory.

```bash
docker-machine stop
VBoxManage modifyvm default --cpus 2
VBoxManage modifyvm default --memory 4096
docker-machine start
```

## Configuration

### Change PORT

default port of **ByteMatrix Viewer**(Web Application) is 8080.
If you want to change port to 80, edit **docker-compose.yml** like below.
```
services :
  bm-viewer :
    ports :
      - "80:8080"
```

default port of **ByteMatrix DB** is 3306.
If you want to change port to another (for example, 3307), edit **docker-compose.yml** like below.
```
services :
  bm-viewer :
    ports :
      - "3307:3306"
```

This port is used for **Bytematrix Crawler**.
