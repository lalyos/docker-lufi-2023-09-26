

Create public image
```
docker build -t ttl.sh/web:v5 .
docker push ttl.sh/web:v5
```

use public image
```
docker run -d -p 8081:80 ttl.sh/web:v5
```

If port is used
```
docker run -d -p 80 ttl.sh/web:v5
```

## From git
```
git clone https://github.com/lalyos/docker-lufi-2023-09-26.git
cd docker-lufi-2023-09-26
docker build -t web:v6 .
```

## use env vars

```
docker run -d \
 -e TITLE="coffebreak for lalyos" \
 -p 80 \
 web:v6
```

## build image directly from git repo

```
docker build -t \
  web:lalyos \
  https://github.com/lalyos/docker-lufi-2023-09-26.git
```

## Networking

poor man's DNS
```
docker run -d --name front --link backend:back web:v7

...
cat /etc/hosts 
172.17.0.9 back
```

CReate network
```
docker network create lufi
```

Use custom bridge network
```
docker run -d --net lufi --name backend -e TITLE=BACKEND web:v7
docker run -d --net lufi --name frontend -e TITLE=front web:v7

$ curl backend
```

## Network -frontend + backend

```
## steal host network
docker run -it --net=host --rm tool

## localhost only
docker run -it --net=none --rm tool
```

## ifconfig tool not istalled in web image
```
docker build -f Dockerfile.tools -t tool .

## start tool container, stealing frontend network:
docker run --name tool --rm --net=container:frontend  -it tool
```

## declarative

```
docker compose up -d
```

## References:

- Traefik + acme https://github.com/lalyos/docker-traefik/
- https://12factor.net/
- 