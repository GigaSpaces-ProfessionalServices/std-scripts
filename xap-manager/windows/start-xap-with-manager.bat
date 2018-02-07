set XAP_HOME=%XAP_HOME%
set BASE_DIR=C:\AA\xap
set LOG_DIR="%BASE_DIR%\logs"
set UNICAST_PORT=7101

set XAP_NIC_ADDRESS=%COMPUTERNAME%
set XAP_MANAGER_SERVERS=%COMPUTERNAME%;zookeeper=2888:3888;lus=%UNICAST_PORT%

set GC_COMMON=-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:+PrintGC -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=200M -Xloggc:%BASE_DIR%\gclogs\gc_%p.log
set GC_GSC=-XX:MaxGCPauseMillis=400 -XX:+UseCompressedOops -XX:InitiatingHeapOccupancyPercent=50
set GC_DEBUG=-XX:+PrintGC -XX:+PrintGCCause -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -XX:+PrintGCApplicationStoppedTime -XX:+PrintGCApplicationConcurrentTime -XX:+PrintAdaptiveSizePolicy -XX:+PrintTenuringDistribution -XX:-PrintReferenceGC -XX:+PrintClassHistogramBeforeFullGC -XX:+PrintClassHistogramAfterFullGC -XX:+PrintParallelOldGCPhaseTimes

set COMMON_XAP_OPTIONS=-XX:+UnlockExperimentalVMOptions -XX:+PrintCommandLineFlags -XX:+PrintFlagsFinal -Dcom.gs.deploy=%BASE_DIR%\deploy  %GC_COMMON% 
set WORK=-Dcom.gs.work=%XAP_HOME%\work -Dgs.gc.collectionTimeThresholdWarning=10000
set COMMON_XAP_OPTIONS_WORK=%COMMON_XAP_OPTIONS% %WORK%

set XAP_LUS_OPTIONS=%XAP_LUS_OPTIONS% -Xmx1g -Xms1g -Xss512m   -Dcom.gigaspaces.unicast.interval=10000,30000,60000
set XAP_GSA_OPTIONS=%XAP_GSA_OPTIONS% -Xmx1g -Xms1g -Xss512m  %COMMON_XAP_OPTIONS_WORK%
set XAP_GSM_OPTIONS=%XAP_GSM_OPTIONS% -Xmx1g -Xms1g -Xss512m  %COMMON_XAP_OPTIONS_WORK% 
set XAP_GSC_OPTIONS=%XAP_GSC_OPTIONS% -Xmx1g -Xms1g -Xss512m  %COMMON_XAP_OPTIONS_WORK%  %GC_GSC% %GC_DEBUG%

set LRMI=-Djava.rmi.server.hostname=%XAP_NIC_ADDRESS% -Dcom.gs.multicast.enabled=false -Dcom.gs.multicast.discoveryPort=%UNICAST_PORT% -Dcom.gigaspaces.start.httpPort=7003 -Dcom.gigaspaces.system.registryPort=7004 -Dcom.gs.transport_protocol.lrmi.bind-port=7110-10000 -Dcom.sun.jini.reggie.initialUnicastDiscoveryPort=%UNICAST_PORT%

set EXT_JAVA_OPTIONS=%EXT_JAVA_OPTIONS% -Dcom.gs.multicast.enabled=false -Dcom.gs.multicast.discoveryPort=7101 -Dcom.sun.jini.reggie.initialUnicastDiscoveryPort=7101 -Dcom.gs.security.enabled=true -Dcom.gs.manager.rest.ssl.enabled=true 

rem EXT_JAVA_OPTIONS=%EXT_JAVA_OPTIONS% -Dcom.gs.multicast.enabled=false -Dcom.gs.multicast.discoveryPort=7101 -Dcom.sun.jini.reggie.initialUnicastDiscoveryPort=7101 
cmd /c "%XAP_HOME%\bin\gs-agent.bat gsa.gsc 4 --manager"