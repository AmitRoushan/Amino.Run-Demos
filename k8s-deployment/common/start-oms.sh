#!/bin/bash -x

#TODO getopt
# $1 = oms-app-entry-point

source /root/amino/common.inc


# TODO: getopt / usage
OMS_PORT=22346
get_container_ip
OMS_IP=$container_ip

if [ -z $OMS_IP ]; then
  echo "ERROR: Failed to get container IP address"
  exit 1
fi

echo "Starting OMS for app $OMS_APP_MAIN_CLASS, listening on $OMS_IP:$OMS_PORT .."
java -cp "/root/amino/jars/*" amino.run.oms.OMSServerImpl --oms-ip $OMS_IP --oms-port $OMS_PORT
