# -- Software Stack Version

SPARK_VERSION="3.5.1"
HADOOP_VERSION="3"
JUPYTERLAB_VERSION="4.1.6"

echo ${SPARK_VERSION}
echo ${HADOOP_VERSION}
echo ${JUPYTERLAB_VERSION}

# -- Building the Images

docker build \
  -f conf/cluster-base.Dockerfile \
  -t cluster-base .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f conf/spark-base.Dockerfile \
  -t spark-base .

docker build \
  -f conf/spark-master.Dockerfile \
  -t spark-master:1.0.0 .

docker build \
  -f conf/spark-worker.Dockerfile \
  -t spark-worker:1.0.0 .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
  -f conf/jupyterlab.Dockerfile \
  -t jupyterlab:1.0.0 .