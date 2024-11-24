

# ENV PYTHON_VERSION="python3.8"
# ENV SPARK_VERSION="spark-3.3.1"
# ENV HADOOP_VERSION="hadoop3"

USER root

RUN apt update && apt install -y curl wget unzip procps default-jdk
# RUN apt update && apt install vim default-jdk -y

RUN wget https://downloads.apache.org/spark/spark-3.4.1/spark-3.4.1-bin-hadoop3.tgz &&\
    tar xvf spark-3.4.1-bin-hadoop3.tgz &&\
    mv spark-3.4.1-bin-hadoop3 /opt/spark

# RUN curl https://dlcdn.apache.org/spark/$SPARK_VERSION/$SPARK_VERSION-bin-$HADOOP_VERSION.tgz -o spark.tgz && \
#     tar -xf spark.tgz && \
#     mv ${SPARK_VERSION}-bin-${HADOOP_VERSION} /usr/bin/ && \
#     mkdir /usr/bin/${SPARK_VERSION}-bin-${HADOOP_VERSION}/logs && \
#     rm spark.tgz

ENV SPARK_HOME=/opt/spark
ENV PATH=PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

# ENV JAVA_HOME=/usr
# ENV SPARK_MASTER_HOST=spark-master
# ENV SPARK_MASTER_PORT=7077
# ENV PYSPARK_PYTHON=/usr/bin/python3

USER airflow 

# ENV JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
# ENV PATH=$PATH:$JAVA_HOME/bin


COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt#{"dirpath":"spark_postgre_elasticsearch/airflow","filename":"scheduler.Dockerfile"}
FROM apache/airflow:2.4.0-python3.8


# ENV PYTHON_VERSION="python3.8"
# ENV SPARK_VERSION="spark-3.3.1"
# ENV HADOOP_VERSION="hadoop3"

USER root

RUN apt update && apt install -y curl wget unzip procps default-jdk
# RUN apt update && apt install vim default-jdk -y

RUN wget https://downloads.apache.org/spark/spark-3.4.1/spark-3.4.1-bin-hadoop3.tgz &&\
    tar xvf spark-3.4.1-bin-hadoop3.tgz &&\
    mv spark-3.4.1-bin-hadoop3 /opt/spark

# RUN curl https://dlcdn.apache.org/spark/$SPARK_VERSION/$SPARK_VERSION-bin-$HADOOP_VERSION.tgz -o spark.tgz && \
#     tar -xf spark.tgz && \
#     mv ${SPARK_VERSION}-bin-${HADOOP_VERSION} /usr/bin/ && \
#     mkdir /usr/bin/${SPARK_VERSION}-bin-${HADOOP_VERSION}/logs && \
#     rm spark.tgz

ENV SPARK_HOME=/opt/spark
ENV PATH=PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

# ENV JAVA_HOME=/usr
# ENV SPARK_MASTER_HOST=spark-master
# ENV SPARK_MASTER_PORT=7077
# ENV PYSPARK_PYTHON=/usr/bin/python3

USER airflow 

# ENV JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
# ENV PATH=$PATH:$JAVA_HOME/bin


COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt