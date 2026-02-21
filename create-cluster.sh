#!/bin/bash

echo "Creating Redis cluster..."

yes yes | docker run -i --rm --net redis-cluster-dev redis:8.6-alpine \
  redis-cli --cluster create \
  redis-node1-dev:6379 \
  redis-node2-dev:6379 \
  redis-node3-dev:6379 \
  redis-node4-dev:6379 \
  redis-node5-dev:6379 \
  redis-node6-dev:6379 \
  --cluster-replicas 1

echo "Done!"
