#!/usr/bin/env bash
#export SPARK_MASTER_IP=`awk 'NR==1 {print $1}' /etc/hosts`
#export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`
export SPARK_LOCAL_IP=0.0.0.0
/usr/local/spark/sbin/start-master.sh --properties-file /spark-defaults.conf -i $SPARK_LOCAL_IP "$@"
tail -f /dev/null
