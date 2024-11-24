
from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql.types import *

spark = (
    SparkSession
    .builder
    # .master('spark://host.docker.internal:7077')
    .appName("airflow-submit2")
    .getOrCreate()
)

data = [
    ("Alice", 31, "New York"),
    ("Bob", 25, "Los Angeles"),
    ("Charlie", 35, "Chicago"),
]

df = spark.createDataFrame(data, ["name", "age", "city"])
df.show()

df.write.format('csv').save('/opt/airflow/data/tmp')#{"dirpath":"spark_postgre_elasticsearch/workspace/dags","filename":"sparkjob.py"}


from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql.types import *

spark = (
    SparkSession
    .builder
    # .master('spark://host.docker.internal:7077')
    .appName("airflow-submit2")
    .getOrCreate()
)

data = [
    ("Alice", 31, "New York"),
    ("Bob", 25, "Los Angeles"),
    ("Charlie", 35, "Chicago"),
]

df = spark.createDataFrame(data, ["name", "age", "city"])
df.show()

df.write.format('csv').save('/opt/airflow/data/tmp')