## 👋 Welcome to proftp 🚀  

proftp README  
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update proftp
```
  
## Install and run container
  
```shell
mkdir -p "$HOME/.local/share/srv/docker/proftp/rootfs"
git clone "https://github.com/dockermgr/proftp" "$HOME/.local/share/CasjaysDev/dockermgr/proftp"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/proftp/rootfs/." "$HOME/.local/share/srv/docker/proftp/rootfs/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-proftp \
--hostname proftp \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$HOME/.local/share/srv/docker/casjaysdevdocker-proftp/rootfs/data:/data:z" \
-v "$HOME/.local/share/srv/docker/casjaysdevdocker-proftp/rootfs/config:/config:z" \
-p 80:80 \
casjaysdevdocker/proftp:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/proftp
    container_name: casjaysdevdocker-proftp
    environment:
      - TZ=America/New_York
      - HOSTNAME=proftp
    volumes:
      - "$HOME/.local/share/srv/docker/casjaysdevdocker-proftp/rootfs/data:/data:z"
      - "$HOME/.local/share/srv/docker/casjaysdevdocker-proftp/rootfs/config:/config:z"
    ports:
      - 80:80
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/proftp
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/proftp" "$HOME/Projects/github/casjaysdevdocker/proftp"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/proftp"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  
