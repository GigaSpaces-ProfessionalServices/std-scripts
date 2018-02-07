#!/usr/bin/bash 

gsas () {
  ps -ef | grep java | grep GSA
}

readonly CNT=$( gsas | wc -l )
if [ $CNT -ne 0 ]; 
then
  echo "There is a GSA already running. Exiting."
  exit 1
fi

. ../archive-xap-logs.sh

source /opt/ccs/xap/scripts/ccs-RELEASE-settings.sh

if [ ${HOSTNAME} = 'htappd01130.qcorpaa.aa.com' ] || [ ${HOSTNAME} = 'htappd01131.qcorpaa.aa.com' ] || [ ${HOSTNAME} = 'htappd01132.qcorpaa.aa.com' ];
then
  nohup ${XAP_HOME}/bin/gs-agent.sh gsa.gsc 3 --manager &> ${LOG_DIR}/gs-agent-console-log.$(date +%Y-%m-%d-%H-%M-%S).log &
else
  nohup ${XAP_HOME}/bin/gs-agent.sh gsa.gsc 3  &> ${LOG_DIR}/gs-agent-console-log.$(date +%Y-%m-%d-%H-%M-%S).log &
fi


sleep 1
