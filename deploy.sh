#!/bin/bash

echo What should the version be?
read VERSION

docker build -t app/server:$VERSION .
docker push app/server:$VERSION
ssh root@x.x.x.x "docker pull app/server:$VERSION && docker tag app/server:$VERSION dokku/api:$VERSION && dokku deploy api $VERSION"