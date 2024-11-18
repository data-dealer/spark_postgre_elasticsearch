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