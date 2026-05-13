## 👋 Welcome to proftpd 🚀  

proftpd README  
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update proftpd
```
  
## Install and run container
  
```shell
dockerHome="/var/lib/srv/$USER/docker/casjaysdevdocker/proftpd/proftpd/latest/rootfs"
mkdir -p "/var/lib/srv/$USER/docker/proftpd/rootfs"
git clone "https://github.com/dockermgr/proftpd" "$HOME/.local/share/CasjaysDev/dockermgr/proftpd"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/proftpd/rootfs/." "$dockerHome/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-proftpd-latest \
--hostname proftpd \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$dockerHome/data:/data:z" \
-v "$dockerHome/config:/config:z" \
-p 80:80 \
casjaysdevdocker/proftpd:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/proftpd
    container_name: casjaysdevdocker-proftpd
    environment:
      - TZ=America/New_York
      - HOSTNAME=proftpd
    volumes:
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/proftpd/proftpd/latest/rootfs/data:/data:z"
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/proftpd/proftpd/latest/rootfs/config:/config:z"
    ports:
      - 80:80
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/proftpd
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/proftpd" "$HOME/Projects/github/casjaysdevdocker/proftpd"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/proftpd"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  
