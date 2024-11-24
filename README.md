- CI/CD with github 
https://docs.github.com/en/actions/writing-workflows/quickstart

# processing 
Init load for serving elacticsearch and postgres
2 hours for 200G data write to postgres

## Potential reasons:
1. Network:
   Network Latency: If your Elasticsearch cluster is hosted on a different machine or in the cloud, network latency can significantly impact the time taken to write data. Each write operation may involve network overhead.

2. Elasticsearch Cluster Configuration: 
   The configuration of your Elasticsearch cluster can affect performance. Factors include:
   Number of nodes: More nodes can improve write throughput.
   Shard configuration: An insufficient number of shards can become a bottleneck. Ensure that your indices are appropriately sharded.
   Replicas: Having multiple replicas can impact write performance, especially if they need to be updated upon each write.

3. Bulk vs. Single Document Writes: 
    Writing data to Elasticsearch in bulk is significantly faster than writing it one document at a time. If your PySpark job is inserting documents one by one, it will take much longer.

## Recommendations to Improve Performance

- Use Bulk Writes: Use the Elasticsearch bulk API to write data in batches. PySpark can be configured to send batches of data to Elasticsearch, reducing the number of requests and speeding up the indexing process.

Optimize Elasticsearch Configuration: Adjust your Elasticsearch settings (number of shards, refresh interval, etc.) to better handle large write operations.

Increase Resources: Ensure your Spark job has enough resources allocated (e.g., increase the number of executors and memory).

Monitor and Profile: Use monitoring tools to identify bottlenecks in your Spark cluster as well as Elasticsearch performance.

Adjust Data Pipeline: Optimize your data transformations in PySpark to minimize shuffling and overhead.

Consider Indexing Strategies: If possible, aggregate data before sending it to Elasticsearch, or adjust your Elasticsearch index settings to accommodate high write loads.


##
https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-bulk.html
https://discuss.elastic.co/t/how-to-increase-writing-speed-to-an-index-using-spark-es/291165/5
Yes, saveToEs uses bulk requests controlled by the properties you mention.



## Spark + LIVI
https://github.com/dsynkov/spark-livy-on-airflow-workspace/tree/master


## install spark in airflow
https://www.howtoforge.com/how-to-install-apache-spark-on-debian-11/


## bulk insert to elasticsearch
https://viblo.asia/p/phan-3-bulk-api-trong-elasticsearch-m68Z0NQj5kG

Lưu ý rằng toàn bộ bulk request sẽ được load trong bộ nhớ của Node nhận request, vì vậy request càng lớn thì bộ nhớ mà Node này dành cho các request khác càng giảm, Điều tệ hại hơn khi request quá lớn khiến ES xử lý các request khác chậm hoặc Node đó bị đơ do thiếu memory, không những nó không cải thiện được performance mà làm cho performance của ES tệ đi Vậy câu hỏi đặt ra ở đây là size của một bulk request là bao nhiêu thì hợp lý? 
Không có câu trả lời cụ thể cho câu hỏi trên, nó phụ thuộc vào hardware, document size, complexity, indexing và search load. Tuy nhiên có một cách dễ dàng để bạn có thể tìm ra con số đó. Hãy bắt đầu một request với batch size từ 1000 đến 5000 Documents, nếu Document của bạn quá lớn thì có thể giảm batch size xuống. Thường thì size của một request để bắt đầu test nên rơi vào khoảng từ 5-15MB. Gửi request này liên tuc đên server đồng thời quan sát hệ thống, nếu mọi thứ vẫn ổn thì tăng dần batch size lên cứ thể cho đến khi bạn tìm thấy một giá trị phù hợp cho batch size.


# kafka connect:
curl -X POST -H "Content-Type: application/json" \
   -d @source_connector_postgres.json http://localhost:8083/connectors#{"dirpath":"spark_postgre_elasticsearch/","filename":"README.md"}
# CI/CD
- CI/CD with github 
https://docs.github.com/en/actions/writing-workflows/quickstart

# processing 
Init load for serving elacticsearch and postgres
2 hours for 200G data write to postgres

## Potential reasons:
1. Network:
   Network Latency: If your Elasticsearch cluster is hosted on a different machine or in the cloud, network latency can significantly impact the time taken to write data. Each write operation may involve network overhead.

2. Elasticsearch Cluster Configuration: 
   The configuration of your Elasticsearch cluster can affect performance. Factors include:
   Number of nodes: More nodes can improve write throughput.
   Shard configuration: An insufficient number of shards can become a bottleneck. Ensure that your indices are appropriately sharded.
   Replicas: Having multiple replicas can impact write performance, especially if they need to be updated upon each write.

3. Bulk vs. Single Document Writes: 
    Writing data to Elasticsearch in bulk is significantly faster than writing it one document at a time. If your PySpark job is inserting documents one by one, it will take much longer.

## Recommendations to Improve Performance

- Use Bulk Writes: Use the Elasticsearch bulk API to write data in batches. PySpark can be configured to send batches of data to Elasticsearch, reducing the number of requests and speeding up the indexing process.

Optimize Elasticsearch Configuration: Adjust your Elasticsearch settings (number of shards, refresh interval, etc.) to better handle large write operations.

Increase Resources: Ensure your Spark job has enough resources allocated (e.g., increase the number of executors and memory).

Monitor and Profile: Use monitoring tools to identify bottlenecks in your Spark cluster as well as Elasticsearch performance.

Adjust Data Pipeline: Optimize your data transformations in PySpark to minimize shuffling and overhead.

Consider Indexing Strategies: If possible, aggregate data before sending it to Elasticsearch, or adjust your Elasticsearch index settings to accommodate high write loads.


##
https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-bulk.html
https://discuss.elastic.co/t/how-to-increase-writing-speed-to-an-index-using-spark-es/291165/5
Yes, saveToEs uses bulk requests controlled by the properties you mention.



## Spark + LIVI
https://github.com/dsynkov/spark-livy-on-airflow-workspace/tree/master


## install spark in airflow
https://www.howtoforge.com/how-to-install-apache-spark-on-debian-11/


## bulk insert to elasticsearch
https://viblo.asia/p/phan-3-bulk-api-trong-elasticsearch-m68Z0NQj5kG

Lưu ý rằng toàn bộ bulk request sẽ được load trong bộ nhớ của Node nhận request, vì vậy request càng lớn thì bộ nhớ mà Node này dành cho các request khác càng giảm, Điều tệ hại hơn khi request quá lớn khiến ES xử lý các request khác chậm hoặc Node đó bị đơ do thiếu memory, không những nó không cải thiện được performance mà làm cho performance của ES tệ đi Vậy câu hỏi đặt ra ở đây là size của một bulk request là bao nhiêu thì hợp lý? 
Không có câu trả lời cụ thể cho câu hỏi trên, nó phụ thuộc vào hardware, document size, complexity, indexing và search load. Tuy nhiên có một cách dễ dàng để bạn có thể tìm ra con số đó. Hãy bắt đầu một request với batch size từ 1000 đến 5000 Documents, nếu Document của bạn quá lớn thì có thể giảm batch size xuống. Thường thì size của một request để bắt đầu test nên rơi vào khoảng từ 5-15MB. Gửi request này liên tuc đên server đồng thời quan sát hệ thống, nếu mọi thứ vẫn ổn thì tăng dần batch size lên cứ thể cho đến khi bạn tìm thấy một giá trị phù hợp cho batch size.


# kafka connect:
curl -X POST -H "Content-Type: application/json" \
   -d @source_connector_postgres.json http://localhost:8083/connectors