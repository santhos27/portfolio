#!/bin/bash

# Define the backup path
IMAGEBACKUP_PATH="backup/images"
VOLUMEBACKUP_PATH="backup/volumes"

# Step 1: Restore Docker images
docker load -i $IMAGEBACKUP_PATH/prometheus_backup_2025-03-20.tar
docker load -i $IMAGEBACKUP_PATH/grafana_backup_2025-03-20.tar
docker load -i $IMAGEBACKUP_PATH/node_exporter_backup_2025-03-20.tar

# Step 2: Restore Volumes
docker run --rm -v prometheus_data:/prometheus -v $VOLUMEBACKUP_PATH:/backup alpine tar xzf /backup/prometheus_data_backup_2025-03-20.tar.gz -C /prometheus
docker run --rm -v grafana_data:/var/lib/grafana -v $VOLUMEBACKUP_PATH:/backup alpine tar xzf /backup/grafana_data_backup_2025-03-20.tar.gz -C /var/lib/grafana

# Step 3: Recreate containers with Docker Compose
docker-compose up -d

echo "Restore process completed successfully."


