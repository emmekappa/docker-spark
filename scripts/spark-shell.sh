#!/usr/bin/env bash
source spark-env.sh
cd /usr/local/spark
./bin/spark-shell \
	--master spark://${SPARK_MASTER_PORT_7077_TCP_ADDR}:${SPARK_MASTER_PORT_7077_TCP_PORT}  \
	-i ${SPARK_LOCAL_IP} \
	--properties-file /spark-defaults.conf \
	"$@" 
