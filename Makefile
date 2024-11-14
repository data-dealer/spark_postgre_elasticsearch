init_all:
	chmod +x .
	docker network create -d bridge global-network || true

	
	cd spark \
		&& docker build -f base-spark.Dockerfile -t local/base-spark:1.1.0 . \
		&& docker build -f workspace.Dockerfile -t local/workspace:1.1.0 . \
		&& cd ..

	docker-compose -f docker-compose-lakehouse.yml -p lakehouse-stack up -d
	docker-compose -f docker-compose-elastic.yml -p elastic-stack up -d