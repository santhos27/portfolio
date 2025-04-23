#!/bin/bash

# Commit containers to images
docker commit prometheus prometheus_backup:latest
docker commit grafana grafana_backup:latest
docker commit node_exporter node_exporter_backup:latest

# Save images to tarballs
docker save -o ./backup/images/prometheus_backup_$(date +\%F).tar prometheus_backup:latest
docker save -o ./backup/images/grafana_backup_$(date +\%F).tar grafana_backup:latest
docker save -o ./backup/images/node_exporter_backup_$(date +\%F).tar node_exporter_backup:latest

# Backup volumes (Prometheus and Grafana data)
docker run --rm --volumes-from prometheus -v ./backup/volumes:/backup alpine tar czf /backup/prometheus_data_backup_$(date +\%F).tar.gz /prometheus
docker run --rm --volumes-from grafana -v ./backup/volumes:/backup alpine tar czf /backup/grafana_data_backup_$(date +\%F).tar.gz /var/lib/grafana

# Upload to S3 (or other remote storage)
#aws s3 cp /path/to/backup/prometheus_backup_$(date +\%F).tar s3://your-backup-bucket/prometheus_backup_$(date +\%F).tar
#aws s3 cp /path/to/backup/grafana_backup_$(date +\%F).tar s3://your-backup-bucket/grafana_backup_$(date +\%F).tar
#aws s3 cp /path/to/backup/node_exporter_backup_$(date +\%F).tar s3://your-backup-bucket/node_exporter_backup_$(date +\%F).tar
#aws s3 cp /path/to/backup/prometheus_data_backup_$(date +\%F).tar.gz s3://your-backup-bucket/prometheus_data_backup_$(date +\%F).tar.gz
#aws s3 cp /path/to/backup/grafana_data_backup_$(date +\%F).tar.gz s3://your-backup-bucket/grafana_data_backup_$(date +\%F).tar.gz

