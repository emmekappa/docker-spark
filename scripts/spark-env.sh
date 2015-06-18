#!/usr/bin/env bash
#wait for ethwe 
sleep 3
ETHWE_IP=`ifconfig ethwe 2>/dev/null | perl -nle 's/dr:(\S+)/print $1/e'`

[ "$SPARK_MASTER_PORT_7077_TCP_ADDR" ] && export SPARK_MASTER_IP=$SPARK_MASTER_PORT_7077_TCP_ADDR
[ "$ETHWE_IP" ] && export SPARK_LOCAL_IP=$ETHWE_IP
[ ! "$SPARK_MASTER_IP" ] && export SPARK_MASTER_IP=$ETHWE_IP

echo SPARK_MASTER_IP=$SPARK_MASTER_IP
echo SPARK_LOCAL_IP=$SPARK_LOCAL_IP
