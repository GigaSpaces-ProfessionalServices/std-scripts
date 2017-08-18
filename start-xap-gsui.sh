#!/bin/sh
source /Users/jason/scratch/scripts/datacenter-settings.sh

export EXT_JAVA_OPTIONS="-Dcom.gs.licensekey=Version=12;otherStuffGoesHereTypically -Dcom.gs.get-build=false"

${XAP_HOME}/bin/gs-ui.sh $*
