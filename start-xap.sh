#!/bin/bash

gsas () {
  ps -ef | grep java | grep GSA
}

readonly CNT=$( gsas | wc -l )
if [ $CNT -ne 0 ];
then
  echo "There is a GSA already running. Exiting."
  exit 1
fi

. ./archive-xap-logs.sh

source ${BASE_DIR}/scripts/datacenter-settings.sh

LOG_DIR="${BASE_DIR}/logs"

${XAP_HOME}/bin/gs-agent.sh gsa.gsc 2 gsa.gsm 1 gsa.lus 1 &> ${LOG_DIR}/gs-agent-console-log.$(date +%Y-%m-%d-%H-%M-%S).log &

sleep 1
