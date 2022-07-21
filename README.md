# local-mongo-replicaset

Provides a 3 node replica set of MongoDB for testing purposes. Please
note that this should **only be used for testing purposes** as the Mongo
DB login credentials are always `root`:`password`.

### Using

```bash
docker pull mongo:5.0.9
openssl rand -base64 700 > file.key
chmod 400 file.key
sudo chown 999 file.key
sudo chgrp 999 file.key
docker-compose up -d
```

List the running containers with `docker-compose ps`. Once the
`mongoinit` container shows a _State_ of `Exit 0`, the Mongo replica set
is ready to be used.

Edit your `/etc/hosts` file and replace the line

```
127.0.0.1	localhost
```

with

```
127.0.0.1	localhost mongo1 mongo2 mongo3
```

You can now connect to this local replica set as `mongodb://root:password@mongo1:30001,mongo2:30002,mongo3:30003/?replicaSet=uhndatalake`.

### Stopping

```bash
docker-compose down
docker-compose rm
docker volume prune -f
```
