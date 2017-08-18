#!/bin/bash 

source /Users/jason/scratch/scripts/datacenter-settings.sh

readonly LOG_ARCHIVE="webui-logs.$(date +%Y-%m-%d-%H-%M-%S).tar"
readonly LOG_DIR="${BASE_DIR}/logs"
readonly LOG_CNT="$( find ${LOG_DIR} -name "*GSWebUI*" -or -name "gs-webui*" | wc -l )"
readonly MYDIR=$(pwd)
cd ${LOG_DIR}
if [ $LOG_CNT -gt 0 ];
then
  echo "Archiving ${LOG_CNT} WEB UI log files to ${LOG_ARCHIVE}"
  #find . -name "*GSWebUI*" -or -name "gs-webui*" -print
  find ${LOG_DIR} -name "*GSWebUI*" -or -name "gs-webui*" -exec tar Prvf ${LOG_ARCHIVE} {} \;
  find ${LOG_DIR} -name "*GSWebUI*" -or -name "gs-webui*" -exec rm {} \;
fi
cd ${MYDIR}

sleep 1
