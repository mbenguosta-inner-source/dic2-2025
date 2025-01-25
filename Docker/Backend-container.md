# MongoDB & Mongo Express deployment

### Build image

```sh
cd backend

docker build -t backend:v1.0.0 .
```

### Network & Volume

```sh
docker network create my-net
docker volume create my-volume
docker volume inspect my-volume
```

### Database container

```sh
docker run -d  -p 27017:27017 --name database \
  --network my-net \
  -v my-volume:/data/db \
  -e MONGO_INITDB_ROOT_USERNAME=user \
  -e MONGO_INITDB_ROOT_PASSWORD=passer \
  mongo
```

### Backend container

```sh
docker run -d -p8000:8000 --name backend \
--network my-net \
-e DATABASE_HOST=database \
-e DATABASE_PORT=27017 \
-e DATABASE_USER=user \
-e DATABASE_PASSWORD=passer  \
backend:v1.0.0
```




### Update & commit image from running container
#### connect to backend Container
```sh
docker exec -it backend /bin/bash
```
#### Update app.py
```sh
sed -i 's/Welcome to this fantastic app/Welcome to app Ibrahima/' app.py
```
#### exit container & commit new image

```sh
docker commit backend backend:v2.0.0
```