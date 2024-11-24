from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator


def processo_etl_spark():
    from pyspark.sql import SparkSession
    spark = SparkSession \
        .builder \
        .appName("Documentos a Pagar") \
        .config("spark.jars.packages",
                "org.mongodb.spark:mongo-spark-connector_2.12:3.0.0,com.microsoft.sqlserver:mssql-jdbc:8.4.1.jre8") \
        .config("spark.driver.maxResultSize", "1g") \
        .config("spark.executor.memory", "1g") \
        .master("spark://host.docker.internal:7077") \
        .getOrCreate()
        
    data = [
        ("Alice", 31, "New York"),
        ("Bob", 25, "Los Angeles"),
        ("Charlie", 35, "Chicago"),
    ]

    df = spark.createDataFrame(data, ["name", "age", "city"])
    df.show()
        
        
dag = DAG(
    dag_id = "sparking_flow",
    default_args = {
        "owner": "max",
        "start_date": airflow.utils.dates.days_ago(1)
    },
    schedule_interval = "@daily"
)

start = PythonOperator(
    task_id="start",
    python_callable = lambda: print("Jobs started"),
    dag=dag
)

# python_job = SparkSubmitOperator(
#     task_id="python_job",
#     conn_id="spark_cluster",
#     application="dags/sparkjob.py",
#     dag=dag
# )

python_job = PythonOperator(
        task_id='elt_documento_pagar_spark',
        python_callable=processo_etl_spark
    )

end = PythonOperator(
    task_id="end",
    python_callable = lambda: print("Jobs completed successfully"),
    dag=dag
)

start >> [python_job] >> end#{"dirpath":"spark_postgre_elasticsearch/workspace/dags","filename":"sparking_flow.py"}
import airflow
from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator


def processo_etl_spark():
    from pyspark.sql import SparkSession
    spark = SparkSession \
        .builder \
        .appName("Documentos a Pagar") \
        .config("spark.jars.packages",
                "org.mongodb.spark:mongo-spark-connector_2.12:3.0.0,com.microsoft.sqlserver:mssql-jdbc:8.4.1.jre8") \
        .config("spark.driver.maxResultSize", "1g") \
        .config("spark.executor.memory", "1g") \
        .master("spark://host.docker.internal:7077") \
        .getOrCreate()
        
    data = [
        ("Alice", 31, "New York"),
        ("Bob", 25, "Los Angeles"),
        ("Charlie", 35, "Chicago"),
    ]

    df = spark.createDataFrame(data, ["name", "age", "city"])
    df.show()
        
        
dag = DAG(
    dag_id = "sparking_flow",
    default_args = {
        "owner": "max",
        "start_date": airflow.utils.dates.days_ago(1)
    },
    schedule_interval = "@daily"
)

start = PythonOperator(
    task_id="start",
    python_callable = lambda: print("Jobs started"),
    dag=dag
)

# python_job = SparkSubmitOperator(
#     task_id="python_job",
#     conn_id="spark_cluster",
#     application="dags/sparkjob.py",
#     dag=dag
# )

python_job = PythonOperator(
        task_id='elt_documento_pagar_spark',
        python_callable=processo_etl_spark
    )

end = PythonOperator(
    task_id="end",
    python_callable = lambda: print("Jobs completed successfully"),
    dag=dag
)

start >> [python_job] >> end