#!/bin/bash
sudo apt update -y
sudo apt install -y nodejs npm
echo 'const MongoClient = require("mongodb").MongoClient;
const uri = "${mongo_connection_string}";
MongoClient.connect(uri, (err, client) => {
  if(err) {
    console.error("Failed to connect to MongoDB", err);
  } else {
    console.log("Connected to MongoDB");
  }
  client.close();
});' > /home/ubuntu/app.js
node /home/ubuntu/app.js
