RUN apk --no-cache add postgresql12-client
# COPY postgres-create-user-db.sh /tmp/postgres-create-user-db.sh
ENV PGPASSWORD=postgres
# RUN /tmp/postgres-create-user-db.sh

ENTRYPOINT [ "bin/sh" ]
# EXPOSE 8000#{"dirpath":"spark_postgre_elasticsearch/storage","filename":"postgres-client.Dockerfile"}
FROM alpine:3.15
RUN apk --no-cache add postgresql12-client
# COPY postgres-create-user-db.sh /tmp/postgres-create-user-db.sh
ENV PGPASSWORD=postgres
# RUN /tmp/postgres-create-user-db.sh

ENTRYPOINT [ "bin/sh" ]
# EXPOSE 8000