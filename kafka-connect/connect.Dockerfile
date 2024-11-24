
#If you want to run a local build of the connector, uncomment the COPY command and make sure the JAR file is in the directory path
#COPY mongo-kafka-connect-<<INSERT BUILD HERE>>3-all.jar /usr/share/confluent-hub-components

# RUN confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:1.8.0
# RUN confluent-hub install --no-prompt confluentinc/kafka-connect-s3:10.3.1

# RUN confluent-hub install debezium/debezium-connector-postgresql:2.7.2
# RUN confluent-hub install debezium/debezium-connector-postgresql:13.1.3


ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components"#{"dirpath":"spark_postgre_elasticsearch/kafka-connect","filename":"connect.Dockerfile"}
FROM confluentinc/cp-kafka-connect:7.2.2

#If you want to run a local build of the connector, uncomment the COPY command and make sure the JAR file is in the directory path
#COPY mongo-kafka-connect-<<INSERT BUILD HERE>>3-all.jar /usr/share/confluent-hub-components

# RUN confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:1.8.0
# RUN confluent-hub install --no-prompt confluentinc/kafka-connect-s3:10.3.1

# RUN confluent-hub install debezium/debezium-connector-postgresql:2.7.2
# RUN confluent-hub install debezium/debezium-connector-postgresql:13.1.3


ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components"