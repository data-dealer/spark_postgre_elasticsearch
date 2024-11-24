      /usr/bin/mc config host add s3 ${S3_ENDPOINT} ${S3_ROOT_USER} ${S3_ROOT_PASSWORD} --api S3v4;
      /usr/bin/mc admin user add s3 ${S3_ACCESS_KEY} ${S3_SECRET_KEY};
      /usr/bin/mc admin policy attach s3 readwrite --user=${S3_ACCESS_KEY};
      /usr/bin/mc ls s3;
      /usr/bin/mc mb --quiet s3/mlflow;
      /usr/bin/mc mb --quiet s3/datalake;
      /usr/bin/mc mb --quiet s3/artifacts;#{"dirpath":"spark_postgre_elasticsearch/storage","filename":"minio-init.sh"}
sleep 5;
      /usr/bin/mc config host add s3 ${S3_ENDPOINT} ${S3_ROOT_USER} ${S3_ROOT_PASSWORD} --api S3v4;
      /usr/bin/mc admin user add s3 ${S3_ACCESS_KEY} ${S3_SECRET_KEY};
      /usr/bin/mc admin policy attach s3 readwrite --user=${S3_ACCESS_KEY};
      /usr/bin/mc ls s3;
      /usr/bin/mc mb --quiet s3/mlflow;
      /usr/bin/mc mb --quiet s3/datalake;
      /usr/bin/mc mb --quiet s3/artifacts;