#!/usr/bin/bash

export JAVA_HOME="/usr/java/latest"

export XAP_HOME="/opt/ccs/xap/current"
export BASE_DIR="${XAP_HOME}/.."
export LOG_DIR="${BASE_DIR}/logs"

export XAP_NIC_ADDRESS="$(hostname)"
export UNICAST_PORT="7101"
export XAP_LOOKUP_GROUPS="ccsdev2"
export XAP_MANAGER_SERVERS="htappd01130.qcorpaa.aa.com:${UNICAST_PORT},htappd01131.qcorpaa.aa.com:${UNICAST_PORT},htappd01132.qcorpaa.aa.com:${UNICAST_PORT}"

export LRMI="-Djava.rmi.server.hostname=${XAP_NIC_ADDRESS} -Dcom.gs.multicast.enabled=false -Dcom.gs.multicast.discoveryPort=${UNICAST_PORT} -Dcom.gigaspaces.start.httpPort=7003 -Dcom.gigaspaces.system.registryPort=7004 -Dcom.gs.transport_protocol.lrmi.bind-port="7110-10000" -Dcom.sun.jini.reggie.initialUnicastDiscoveryPort=${UNICAST_PORT}"

export EXT_JAVA_OPTIONS=${EXT_JAVA_OPTIONS} -Dcom.gs.multicast.enabled=false -Dcom.gs.multicast.discoveryPort=${UNICAST_PORT} -Dcom.sun.jini.reggie.initialUnicastDiscoveryPort=${UNICAST_PORT} -Dcom.gs.security.enabled=true -Dcom.gs.manager.rest.ssl.enabled=true 

export MGT_HEAP="-Xmx1g -Xms1g"
export WEBUI_HEAP="-Xms2g -Xmx2g"
export GSC_HEAP="-Xmx16g -Xms16g"

export GC_COMMON="-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:+PrintGC -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=200M -Xloggc:${BASE_DIR}/gclogs/gc_%p.log"
export GC_GSC="-XX:MaxGCPauseMillis=400 -XX:+UseCompressedOops -XX:InitiatingHeapOccupancyPercent=50"
export GC_DEBUG="-XX:+PrintGC -XX:+PrintGCCause -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -XX:+PrintGCApplicationStoppedTime -XX:+PrintGCApplicationConcurrentTime -XX:+PrintAdaptiveSizePolicy -XX:+PrintTenuringDistribution -XX:-PrintReferenceGC -XX:+PrintClassHistogramBeforeFullGC -XX:+PrintClassHistogramAfterFullGC -XX:+PrintParallelOldGCPhaseTimes"

export SECURITY="-Dcom.gs.security.enabled=true -Dcom.gs.security.fs.file-service.file-path=${BASE_DIR}/security/gs-directory.fsm -Dcom.gigaspaces.logger.RollingFileHandler.filename-pattern.homedir=${BASE_DIR}"
export AGENT="-agentpath:/opt/DT/libdtagent.so=name=Gigaspaces_Dev,server=otapnd71.qcorpaa.aa.com:9998,logpath=/opt/DT/log"

export COMMON_XAP_OPTIONS="-XX:+UnlockExperimentalVMOptions -XX:+PrintCommandLineFlags -XX:+PrintFlagsFinal -Dcom.gs.deploy=${BASE_DIR}/deploy ${LRMI} ${GC_COMMON} ${SECURITY}"
export WORK="-Dcom.gs.work=${XAP_HOME}/work -Dgs.gc.collectionTimeThresholdWarning=10000"
export COMMON_XAP_OPTIONS_WORK="${COMMON_XAP_OPTIONS} ${WORK}"


export XAP_GSM_OPTIONS="${MGT_HEAP} ${COMMON_XAP_OPTIONS_WORK}"
export XAP_LUS_OPTIONS="${MGT_HEAP} ${COMMON_XAP_OPTIONS_WORK}"
export XAP_GSA_OPTIONS="${MGT_HEAP} ${COMMON_XAP_OPTIONS_WORK}"
export XAP_GSC_OPTIONS="${GSC_HEAP} ${COMMON_XAP_OPTIONS_WORK} ${GC_GSC} ${GC_DEBUG} ${AGENT}"
export XAP_WEBUI_OPTIONS="${WEBUI_HEAP} ${COMMON_XAP_OPTIONS} -Dcom.gs.transport_protocol.lrmi.request_timeout=30000"
