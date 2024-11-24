	chmod +x .
	docker network create -d bridge global-network || true
	
	docker network create -d bridge subnet-airflow-spark || true
	docker network create -d bridge subnet-elastic-spark || true



	cd storage \
		&& docker build -f postgres-client.Dockerfile -t local/postgres-client . \
		&& cd ..
	
	cd airflow \
		&& docker build -f Dockerfile -t local/airflow:1.1.1 . \
		&& cd ..

	cd spark \
		&& docker build -f base-spark.Dockerfile -t local/base-spark:1.1.0 . \
		&& docker build -f workspace.Dockerfile -t local/workspace:1.1.0 . \
		&& docker build -f livi.Dockerfile -t local/livi:1.1.0 . \
		&& cd ..

	cd kafka-connect && docker build -f connect.Dockerfile -t connect-base:1.0.0 .

	docker-compose --env-file storage/.env -f docker-compose-storage.yml -p storage-stack up -d
	docker-compose -f docker-compose-lakehouse.yml -p lakehouse-stack up -d
	docker-compose -f docker-compose-airflow.yml -p airflow-stack up -d
	docker-compose -f docker-compose-elastic.yml -p elastic-stack up -d

	docker-compose -f docker-compose-kafka-2.yml -p kafka-stack up -d
	
	chmod 666 /var/run/docker.sock



## docker exec -it scheduler-1 bash -c "apt update && apt install vim default-jdk -y"
## echo "export JAVA_HOME='/usr/lib/jvm/default-jdk'" >> ~/.bashrc
## echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc
## source ~/.bashrc
## docker exec -itu 0 airflow_scheduler passwd
## 
## ~/.bashr#{"dirpath":"spark_postgre_elasticsearch/","filename":"Makefile"}
init_all:
	chmod +x .
	docker network create -d bridge global-network || true
	
	docker network create -d bridge subnet-airflow-spark || true
	docker network create -d bridge subnet-elastic-spark || true



	cd storage \
		&& docker build -f postgres-client.Dockerfile -t local/postgres-client . \
		&& cd ..
	
	cd airflow \
		&& docker build -f Dockerfile -t local/airflow:1.1.1 . \
		&& cd ..

	cd spark \
		&& docker build -f base-spark.Dockerfile -t local/base-spark:1.1.0 . \
		&& docker build -f workspace.Dockerfile -t local/workspace:1.1.0 . \
		&& docker build -f livi.Dockerfile -t local/livi:1.1.0 . \
		&& cd ..

	cd kafka-connect && docker build -f connect.Dockerfile -t connect-base:1.0.0 .

	docker-compose --env-file storage/.env -f docker-compose-storage.yml -p storage-stack up -d
	docker-compose -f docker-compose-lakehouse.yml -p lakehouse-stack up -d
	docker-compose -f docker-compose-airflow.yml -p airflow-stack up -d
	docker-compose -f docker-compose-elastic.yml -p elastic-stack up -d

	docker-compose -f docker-compose-kafka-2.yml -p kafka-stack up -d
	
	chmod 666 /var/run/docker.sock



## docker exec -it scheduler-1 bash -c "apt update && apt install vim default-jdk -y"
## echo "export JAVA_HOME='/usr/lib/jvm/default-jdk'" >> ~/.bashrc
## echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc
## source ~/.bashrc
## docker exec -itu 0 airflow_scheduler passwd
## 
## ~/.bashr