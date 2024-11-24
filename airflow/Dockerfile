# FROM apache/airflow:2.7.1-python3.11


USER root
RUN apt-get update && \
    apt-get install -y gcc python3-dev openjdk-11-jdk && \
    apt-get clean

# Set JAVA_HOME environment variable
# ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-arm64 # macm1
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

RUN chmod +x /opt/airflow


USER airflow
RUN python3 -m pip install pip --upgrade
# fix AttributeError: module 'lib' has no attribute 'X509_V_FLAG_NOTIFY_POLICY'
RUN pip install pyopenssl --upgrade 
## install to trigger spark jobs
RUN pip install apache-airflow-providers-apache-spark pyspark
# apache-airflow-providers-openlineage>=1.8.0 
# apache-airflow==2.4.0 #{"dirpath":"spark_postgre_elasticsearch/airflow","filename":"Dockerfile"}
FROM apache/airflow:2.4.0-python3.8
# FROM apache/airflow:2.7.1-python3.11


USER root
RUN apt-get update && \
    apt-get install -y gcc python3-dev openjdk-11-jdk && \
    apt-get clean

# Set JAVA_HOME environment variable
# ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-arm64 # macm1
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

RUN chmod +x /opt/airflow


USER airflow
RUN python3 -m pip install pip --upgrade
# fix AttributeError: module 'lib' has no attribute 'X509_V_FLAG_NOTIFY_POLICY'
RUN pip install pyopenssl --upgrade 
## install to trigger spark jobs
RUN pip install apache-airflow-providers-apache-spark pyspark
# apache-airflow-providers-openlineage>=1.8.0 
# apache-airflow==2.4.0 