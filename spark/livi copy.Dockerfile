
USER root
ENV LIVY_HOME /opt/bitnami/livy
WORKDIR /opt/bitnami/

COPY livy.conf /opt/bitnami/livy/conf/livy.conf 
COPY log4j.properties /opt/bitnami/livy/conf/log4j.properties

RUN apt update && apt install curl -y

RUN install_packages unzip \
    && curl "https://downloads.apache.org/incubator/livy/0.7.1-incubating/apache-livy-0.7.1-incubating-bin.zip" -O \
    && unzip "apache-livy-0.7.1-incubating-bin" \
    && rm -rf "apache-livy-0.7.1-incubating-bin.zip" \
    && mv "apache-livy-0.7.1-incubating-bin" $LIVY_HOME \
    && mkdir $LIVY_HOME/logs \
    && chown -R 1001:1001 $LIVY_HOME

USER 1001#{"dirpath":"spark_postgre_elasticsearch/spark","filename":"livi copy.Dockerfile"}
FROM bitnami/spark:3.3.4

USER root
ENV LIVY_HOME /opt/bitnami/livy
WORKDIR /opt/bitnami/

COPY livy.conf /opt/bitnami/livy/conf/livy.conf 
COPY log4j.properties /opt/bitnami/livy/conf/log4j.properties

RUN apt update && apt install curl -y

RUN install_packages unzip \
    && curl "https://downloads.apache.org/incubator/livy/0.7.1-incubating/apache-livy-0.7.1-incubating-bin.zip" -O \
    && unzip "apache-livy-0.7.1-incubating-bin" \
    && rm -rf "apache-livy-0.7.1-incubating-bin.zip" \
    && mv "apache-livy-0.7.1-incubating-bin" $LIVY_HOME \
    && mkdir $LIVY_HOME/logs \
    && chown -R 1001:1001 $LIVY_HOME

USER 1001