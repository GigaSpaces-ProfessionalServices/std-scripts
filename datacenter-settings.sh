#!/bin/bash

export JAVA_HOME="$(/usr/libexec/java_home)"

export XAP_HOME="/Users/jason/scratch/current"
export BASE_DIR="${XAP_HOME}/.."

IP_ADDR="192.168.2.1"
export XAP_NIC_ADDRESS="${IP_ADDR}"
export UNICAST_PORT="7101"
export XAP_LOOKUP_LOCATORS="${IP_ADDR}:${UNICAST_PORT}"
export LRMI="-Djava.rmi.server.hostname=${XAP_NIC_ADDRESS} -Dcom.gs.multicast.enabled=false -Dcom.gs.multicast.discoveryPort=${UNICAST_PORT} -Dcom.sun.jini.reggie.initialUnicastDiscoveryPort=${UNICAST_PORT}"

MGT_HEAP="-Xmx1g -Xms1g"
WEBUI_HEAP="-Xms2g -Xmx2g"
GSC_HEAP="-Xmx4g -Xms4g"

GC="-XX:+UseG1GC -XX:+PrintGC -XX:+ExplicitGCInvokesConcurrent -Xloggc:${BASE_DIR}/gclogs/gc_%p.log"

COMMON_XAP_OPTIONS="-XX:+UnlockExperimentalVMOptions -XX:+PrintCommandLineFlags -XX:+PrintFlagsFinal -Dcom.gs.deploy=${BASE_DIR}/deploy ${LRMI} ${GC}"
# WORK is pulled out of the WEB UI JVM options b/c/o the way that the start-xap-webui.sh script is implemented
WORK="-Dcom.gs.work=${BASE_DIR}/work"
COMMON_XAP_OPTIONS_WORK="${COMMON_XAP_OPTIONS} ${WORK}"

export XAP_GSM_OPTIONS="${MGT_HEAP} ${COMMON_XAP_OPTIONS_WORK}"
export XAP_LUS_OPTIONS="${MGT_HEAP} ${COMMON_XAP_OPTIONS_WORK}"
export XAP_GSA_OPTIONS="${MGT_HEAP} ${COMMON_XAP_OPTIONS_WORK}"
export XAP_GSC_OPTIONS="${GSC_HEAP} ${COMMON_XAP_OPTIONS_WORK} ${GC_DEBUG}" # AGENT INFO SHOULD BE ADDED HERE
export XAP_WEBUI_OPTIONS="${WEBUI_HEAP} ${COMMON_XAP_OPTIONS} ${SECURITY} -Dcom.gs.transport_protocol.lrmi.request_timeout=30000"                                                                                                                                      
