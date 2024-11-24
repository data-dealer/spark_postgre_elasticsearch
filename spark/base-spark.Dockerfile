FROM bitnami/spark:3.3.4
USER root
RUN apt-get update
RUN apt-get install -y wget

COPY requirements.txt ${SPARK_HOME}/requirements.txt
COPY spark-defaults.conf ${SPARK_HOME}/conf/spark-defaults.conf


RUN pip3 install -r requirements.txt

# init_parkages 
RUN (echo "from pyspark.sql import SparkSession"; echo "try: SparkSession.builder.master('spark://localhost:7077').getOrCreate()";  echo "except: pass") >> init_parkages.py
RUN ${SPARK_HOME}/bin/spark-submit init_parkages.py#{"dirpath":"spark_postgre_elasticsearch/spark","filename":"base-spark.Dockerfile"}

FROM bitnami/spark:3.3.4
USER root
RUN apt-get update
RUN apt-get install -y wget

COPY requirements.txt ${SPARK_HOME}/requirements.txt
COPY spark-defaults.conf ${SPARK_HOME}/conf/spark-defaults.conf


RUN pip3 install -r requirements.txt

# init_parkages 
RUN (echo "from pyspark.sql import SparkSession"; echo "try: SparkSession.builder.master('spark://localhost:7077').getOrCreate()";  echo "except: pass") >> init_parkages.py
RUN ${SPARK_HOME}/bin/spark-submit init_parkages.py