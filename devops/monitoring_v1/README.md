📌 Notes
--------
⚠️ This project is currently in development. Additional dashboards, exporters, and automation scripts will be added soon.
------------------------------------------------------------------------------------------------------------------------
🚀 Monitoring Stack v1 – DevOps Portfolio Project
-------------------------------------------------
Welcome to Monitoring Stack v1, 
A containerized monitoring solution built with Prometheus, Grafana, SNMP Exporter, and Portainer. 
This project is a part of my DevOps portfolio to showcase real-world monitoring architecture for hybrid infrastructure environments including Linux, Windows servers, Cisco switches, and more.

📦 Stack Overview
-----------------
This project leverages Docker Compose to orchestrate the following components:

Component	Purpose
---------	-------
Prometheus	Time-series data collection and monitoring engine
Grafana		Data visualization and alerting frontend
SNMP Exporter	SNMP metrics gathering for network devices (e.g., switches, firewalls)
Portainer	Web-based container management dashboard

🛠️ Tech Stack
-------------
Docker & Docker Compose

Prometheus

Grafana

SNMP Exporter

Portainer

Custom YAML Configurations

Configurations

🧭 Directory Structure:
-----------------------
<pre> ``` PORTFOLIO/
	    └── docker/
	    	└── monitoring_v1/
        		├── docker-compose.yml
	        	└── volume/
        	   	├── grafana/
	            	│   ├── dashboards/
	           	│   ├── datasource.yml
	            	│   └── logs/
	            	├── portainer/
	            	│   └── certs/
	            	│       ├── portainer.crt
	            	│       └── portainer.key
	            	├── prometheus/
	            	│   ├── backups/
	            	│   └── prometheus.yml
	            	└── snmp_exporter/
	                	└── snmp.yml ``` </pre>

🚀 Getting Started
------------------
1-> Clone the repository:
	git clone https://github.com/your-username/monitoring_stack_v1.git
	cd monitoring_stack_v1/docker/monitoring_v1
2-> Launch the stack:
	docker-compose up -d
3-> Access the services:
	|-------------------------------------------------------------------------------------------------------|
	|Service	|				URL				|Default Credentials	|
	|-------------------------------------------------------------------------------------------------------|
	|Prometheus 	|	http://localhost:9200 (ip_of_local_machine:9200)	|  Set on first login	|
	|Grafana 	|	http://localhost:3100 (ip_of_local_machine:3100) 	|(login: admin / admin)	|
	|Portainer 	|	https://localhost:9443 (ip_of_local_machine:9443)	|  Set on first login	|
	|SNMP Exporter 	|	http://localhost:9116/metrics				|	 N/A		|
	|-------------------------------------------------------------------------------------------------------|

📊 Grafana Configuration:
-------------------------
Datasource: Auto-provisioned via volume/grafana/datasource.yml

Dashboards: Custom dashboards can be mounted via volume/grafana/dashboards

🔍 Prometheus Targets:
----------------------
Prometheus scrapes metrics from:

	Linux Node Exporters

	Windows Node Exporters

	Cisco Switches (via SNMP Exporter)

	WatchGuard Firewalls (via SNMP Exporter)

Target and auth details are defined in:

	prometheus.yml (scraping logic)

	snmp.yml (auth + SNMP modules)

🔒 Security:
------------
Portainer is configured with custom SSL certificates (.crt and .key)

Credentials and SNMP community strings are managed securely in snmp.yml (replace before production!)

📁 Volumes:
-----------
Persistent volumes are used to store:

	Prometheus data

	Grafana dashboards and logs

	Portainer settings and SSL certificates


⭐️ Show Some Love:
------------------
If you found this project useful, consider giving it a ⭐️ on GitHub! Your support motivates continued development.
