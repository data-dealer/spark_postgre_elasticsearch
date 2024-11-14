from pyspark.sql import SparkSession

jar_packages = [
    "org.apache.spark:spark-sql-kafka-0-10_2.12:3.1.2"
]
spark = (
    SparkSession
    .builder
    .master("spark://spark-master:7077")
    .appName("spark_init_packages")
    .config("spark.jars.packages",
            ",".join(jar_packages)
            )
    .getOrCreate()
)
