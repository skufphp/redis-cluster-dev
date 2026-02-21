#!/bin/bash

echo "WARNING: This will destroy all Redis cluster data"
read -r -p "Proceed? (yes/no): " confirm

if [[ "$confirm" != "yes" ]]; then
  echo "Aborted"
  exit 1
fi

echo "Stopping Redis containers..."
docker compose -p redis-cluster-dev down -v

echo "Removing Redis data..."
rm -rf ./data/redis-node*

echo "Starting Redis containers..."
docker compose -p redis-cluster-dev up -d

echo "Waiting 5s for nodes to initialize..."
sleep 5

echo "Creating Redis cluster..."
./create-cluster.sh

echo "Redis cluster reset complete!"
