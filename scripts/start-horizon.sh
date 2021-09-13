#!/bin/bash

# Ensure that the storage directories exist
mkdir -p /app/storage/framework/{sessions,views,cache}

cd /app
while [ 1 -gt 0 ]; do
  echo Starting Horizon
  php artisan horizon
  sleep 5
done
