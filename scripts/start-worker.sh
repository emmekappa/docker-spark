#!/usr/bin/env bash
source spark-env.sh
cd /usr/local/spark
./bin/spark-class org.apache.spark.deploy.worker.Worker \
	spark://${SPARK_MASTER_PORT_7077_TCP_ADDR}:${SPARK_MASTER_PORT_7077_TCP_PORT} \
	--properties-file /spark-defaults.conf \
	-i $SPARK_LOCAL_IP \
	"$@"
