# Deploy mongoDB database with mongo express

Create network & volume
```sh
docker network create mynet
docker volume create myvol
```

Run mongoDB container, attach network, create user  & mount volume
```sh
docker run -d \
  --name databaseService \
  --net mynet \
  -v myvol:/data/db \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=pass \
  -p 27017:27017 \
  mongo
```
Launch mongo express to connect to mongoDB 

```sh
docker run -d \
  --name mongo-express \
  --net mynet \
  -e ME_CONFIG_MONGODB_ADMINUSERNAME='admin' \
  -e ME_CONFIG_MONGODB_ADMINPASSWORD='pass' \
  -e ME_CONFIG_MONGODB_URL='mongodb://admin:pass@databaseService:27017/' \
  -p 8081:8081 \
  mongo-express:latest
```
Connect to your mongo express UI with [http://localhost:8081/](http://localhost:8081)
If a ussr and password is reqired to connect to mongo-express set <b>admin</b> and <b>pass</b>