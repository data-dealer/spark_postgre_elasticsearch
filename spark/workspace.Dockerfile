FROM local/base-spark:1.1.0

#=========== install jupyterlab  ===========#
ENV SHARED_WORKSPACE=/opt/workspace
RUN mkdir -p ${SHARED_WORKSPACE}
WORKDIR ${SHARED_WORKSPACE}

RUN pip3 install jupyterlab
EXPOSE 8888
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=