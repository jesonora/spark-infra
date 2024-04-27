FROM cluster-base

# -- Layer: JupyterLab

ARG spark_version=3.1.2
ARG jupyterlab_version=4.1.6

RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    pip3 install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version} pandas

ENV SHELL /bin/bash
# -- Runtime

EXPOSE 8888 4040
WORKDIR ${SHARED_WORKSPACE}
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=