#!/usr/bin/env bash
ETHWE_IP=`ifconfig ethwe 2>/dev/null | perl -nle 's/dr:(\S+)/print $1/e'`
export SPARK_MASTER_IP=`awk 'NR==1 {print $1}' /etc/hosts`
export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`
[ "$ETHWE_IP" ] && export SPARK_MASTER_IP=$ETHWE_IP
[ "$ETHWE_IP" ] && export SPARK_LOCAL_IP=$ETHWE_IP
/usr/local/spark/sbin/start-master.sh --properties-file /spark-defaults.conf -i $SPARK_LOCAL_IP "$@"
tail -f /dev/null
