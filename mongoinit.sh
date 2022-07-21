#!/bin/bash

sleep 5;
mongo --host mongo1:30001 --username root --password password --eval \
'
db = (new Mongo("mongodb://root:password@mongo1:30001")).getDB("sling");
config = {
  "_id": "uhndatalake",
  "members": [
    {
      "_id": 0,
      "host": "mongo1:30001"
    },
    {
      "_id": 1,
      "host": "mongo2:30002"
    },
    {
      "_id": 2,
      "host": "mongo3:30003"
    }
  ]
};
rs.initiate(config);
'
