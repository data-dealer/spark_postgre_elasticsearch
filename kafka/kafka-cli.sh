docker-compose exec kafka-cli/bin/kafka-topics.sh \
 --bootstrap-server host.docker.internal:9092,host.docker.internal:9093 \
 --create --topic topic-xx2 --partitions 2 --replication-factor 2

kafka/bin/kafka-topics.sh --bootstrap-server host.docker.internal:9092,host.docker.internal:9093,host.docker.internal:9094 \
 --create --topic topic-2 --partitions 2 --replication-factor 1

docker-compose exec kafka-cli python feed.py
10.169.15.48

# kafkacli/bin/kafka-topics.sh \
#     --bootstrap-server 192.168.8.106:9092 \
#     --create \
#     --topic yourTopicName \
#     --partitions 2  \
#     --replication-factor 3 \
#     --config min.insync.replicas=2#{"dirpath":"spark_postgre_elasticsearch/kafka","filename":"kafka-cli.sh"}

docker-compose exec kafka-cli/bin/kafka-topics.sh \
 --bootstrap-server host.docker.internal:9092,host.docker.internal:9093 \
 --create --topic topic-xx2 --partitions 2 --replication-factor 2

kafka/bin/kafka-topics.sh --bootstrap-server host.docker.internal:9092,host.docker.internal:9093,host.docker.internal:9094 \
 --create --topic topic-2 --partitions 2 --replication-factor 1

docker-compose exec kafka-cli python feed.py
10.169.15.48

# kafkacli/bin/kafka-topics.sh \
#     --bootstrap-server 192.168.8.106:9092 \
#     --create \
#     --topic yourTopicName \
#     --partitions 2  \
#     --replication-factor 3 \
#     --config min.insync.replicas=2