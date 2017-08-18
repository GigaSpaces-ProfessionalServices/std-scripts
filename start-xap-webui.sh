#!/bin/bash -x
echo "XXXXXXXXXXXXXX : This doesn't work with gigaspaces-xap-premium-12.2.0-m9-b18010 : XXXXXXXXXXXXX "
exit 1
webuis () {
  ps -ef | grep java | grep -i webui
}

readonly CNT=$( webuis | wc -l )
if [ $CNT -ne 0 ]; 
then
  echo "ERROR: There is a WEB UI already running. Exiting."
  exit 1
fi

. ./archive-webui-logs.sh
source /Users/jason/scratch/scripts/datacenter-settings.sh

export USER_NAME_MANDATORY=true

nohup ${XAP_HOME}/bin/gs-webui.sh &> ${LOG_DIR}/gs-webui-console-log.$(date +%Y-%m-%d-%H-%M-%S).log &
nohup ./webui-liveness.sh &> /dev/null &

sleep 1
exit 0
