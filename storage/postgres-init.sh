set -u
# https://github.com/docker-library/postgres/issues/151
# https://stackoverflow.com/questions/70356736/postgres-lean-docker-image-containing-only-psql-client

alias psql="psql -U postgres --host host.docker.internal --port 5432"

create_user_pass_db () {
    echo "Creating: user: '$1' | password: '$2' | database : '$3'" 
    psql <<-EOSQL 
    CREATE USER $1 WITH CREATEDB PASSWORD '$2' 
EOSQL
    psql <<-EOSQL 
    CREATE DATABASE $3 OWNER $1 
EOSQL
}

# create_user_pass_db "airflow" "airflow" "airflowdb"
create_user_pass_db "mlflow" "mlflow" "mlflowdb"#{"dirpath":"spark_postgre_elasticsearch/storage","filename":"postgres-init.sh"}
set -e
set -u
# https://github.com/docker-library/postgres/issues/151
# https://stackoverflow.com/questions/70356736/postgres-lean-docker-image-containing-only-psql-client

alias psql="psql -U postgres --host host.docker.internal --port 5432"

create_user_pass_db () {
    echo "Creating: user: '$1' | password: '$2' | database : '$3'" 
    psql <<-EOSQL 
    CREATE USER $1 WITH CREATEDB PASSWORD '$2' 
EOSQL
    psql <<-EOSQL 
    CREATE DATABASE $3 OWNER $1 
EOSQL
}

# create_user_pass_db "airflow" "airflow" "airflowdb"
create_user_pass_db "mlflow" "mlflow" "mlflowdb"