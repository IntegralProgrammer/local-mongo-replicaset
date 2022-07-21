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

### Stopping

```bash
docker-compose down
docker-compose rm
docker volume prune -f
```
