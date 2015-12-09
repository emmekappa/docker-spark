#!/usr/bin/env bash

source spark-env.sh

/usr/local/spark/sbin/start-master.sh --properties-file /spark-defaults.conf -h $SPARK_LOCAL_IP "$@"
tail -f /dev/null
