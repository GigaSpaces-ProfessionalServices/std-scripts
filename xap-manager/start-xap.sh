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



source ../ccs-RELEASE-settings.sh

if [ ${HOSTNAME} = 'host1' ] || [ ${HOSTNAME} = 'host2' ] || [ ${HOSTNAME} = 'host3' ];
then
  nohup ${XAP_HOME}/bin/gs-agent.sh gsa.gsc 3 --manager &> ${LOG_DIR}/gs-agent-console-log.$(date +%Y-%m-%d-%H-%M-%S).log &
else
  nohup ${XAP_HOME}/bin/gs-agent.sh gsa.gsc 3  &> ${LOG_DIR}/gs-agent-console-log.$(date +%Y-%m-%d-%H-%M-%S).log &
fi


sleep 1
