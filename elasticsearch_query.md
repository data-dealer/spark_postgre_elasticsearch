{
  "query": "SELECT * FROM customer_index2"
}


GET /customer_index_tmp/_mapping
GET /customer_index1m_2_shards/_stats
GET /customer_index_tmp/_search_shards

GET /customer_index1m_12core/_stats


POST _sql?format=json
{
  "query": "SELECT count(1) FROM customer_index1m_2_shards"
}


GET /customer_index/_

POST _sql?format=csv
{
  "query": "SELECT * FROM test"
}

PUT /custom_index

PUT /my-index-000001
{
  "settings": {
    "index": {
      "number_of_shards": 2,  
      "number_of_replicas": 0,
      "refresh_interval": "20s"
    }
  }
}

PUT /custom_index_2
{
  "settings": {
    "index": {
      "number_of_shards": 2,  
      "number_of_replicas": 0,
      "refresh_interval": "20s"
    }
  }
}


POST _bulk
{ "index" : { "_index" : "test", "_id" : "1" } }
{ "field1" : "value1" }
{ "delete" : { "_index" : "test", "_id" : "2" } }
{ "create" : { "_index" : "test", "_id" : "3" } }
{ "field1" : "value3" }
{ "update" : {"_id" : "1", "_index" : "test"} }
{ "doc" : {"field2" : "value2"} }#{"dirpath":"spark_postgre_elasticsearch/","filename":"elasticsearch_query.md"}
POST _sql?format=json
{
  "query": "SELECT * FROM customer_index2"
}


GET /customer_index_tmp/_mapping
GET /customer_index1m_2_shards/_stats
GET /customer_index_tmp/_search_shards

GET /customer_index1m_12core/_stats


POST _sql?format=json
{
  "query": "SELECT count(1) FROM customer_index1m_2_shards"
}


GET /customer_index/_

POST _sql?format=csv
{
  "query": "SELECT * FROM test"
}

PUT /custom_index

PUT /my-index-000001
{
  "settings": {
    "index": {
      "number_of_shards": 2,  
      "number_of_replicas": 0,
      "refresh_interval": "20s"
    }
  }
}

PUT /custom_index_2
{
  "settings": {
    "index": {
      "number_of_shards": 2,  
      "number_of_replicas": 0,
      "refresh_interval": "20s"
    }
  }
}


POST _bulk
{ "index" : { "_index" : "test", "_id" : "1" } }
{ "field1" : "value1" }
{ "delete" : { "_index" : "test", "_id" : "2" } }
{ "create" : { "_index" : "test", "_id" : "3" } }
{ "field1" : "value3" }
{ "update" : {"_id" : "1", "_index" : "test"} }
{ "doc" : {"field2" : "value2"} }