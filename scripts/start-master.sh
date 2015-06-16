#!/usr/bin/env bash
ifconfig
sleep 10
ifconfig
ETHWE_IP=`ifconfig ethwe 2>/dev/null | perl -nle 's/dr:(\S+)/print $1/e'`
export SPARK_MASTER_IP=`awk 'NR==1 {print $1}' /etc/hosts`
export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`
if [ "$ETHWE_IP" ]; then
	echo "ethwe detected... binding spark to $ETHWE_IP"
	export SPARK_MASTER_IP=$ETHWE_IP
	export SPARK_LOCAL_IP=$ETHWE_IP
else
	echo "binding spark to $SPARK_LOCAL_IP"
fi
/usr/local/spark/sbin/start-master.sh --properties-file /spark-defaults.conf -i $SPARK_LOCAL_IP "$@"
tail -f /dev/null
