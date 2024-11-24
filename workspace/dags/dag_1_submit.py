import datetime
from airflow import DAG
from airflow.operators.empty import EmptyOperator
from airflow.operators.python_operator import PythonOperator
from airflow.operators.bash_operator import BashOperator


with DAG(
    dag_id="my_dag_name",
    start_date=datetime.datetime(2024, 11, 18),
    schedule="@daily",
):

    task_elt_documento_pagar = BashOperator(
        task_id='elt_spark',
        bash_command="python ./dags/sparkjob.py",
    )#{"dirpath":"spark_postgre_elasticsearch/workspace/dags","filename":"dag_1_submit.py"}

import datetime
from airflow import DAG
from airflow.operators.empty import EmptyOperator
from airflow.operators.python_operator import PythonOperator
from airflow.operators.bash_operator import BashOperator


with DAG(
    dag_id="my_dag_name",
    start_date=datetime.datetime(2024, 11, 18),
    schedule="@daily",
):

    task_elt_documento_pagar = BashOperator(
        task_id='elt_spark',
        bash_command="python ./dags/sparkjob.py",
    )