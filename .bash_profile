# An InsightEdge-maintainer-friendly bash profile.

alias l='ls -lash'
alias cl='clear'

export BD="/opt/xap"
export SCR="${BD}/scripts"
export X12="${BD}/current"
export LOGS="${BD}/logs"
export GCLOGS="${BD}/gclogs"

gsas () {
  ps -ef | grep java | grep GSA
}

gscs () {
  ps -ef | grep java | grep GSC
}

webuis () {
  ps -ef | grep java | grep -i webui
}

luss () {
  ps -ef | grep java | grep LH
}

gsms () {
  ps -ef | grep java | grep GSM
}

notxapjavas () {
  ps -ef | grep java | grep -v GSM | grep -v LH | grep -v GSC | grep -v GSA | grep -iv webu | grep -v MainUI
}

nint () {
 ps -ef | grep java | grep -iv intellij
}

zks () {
 ps -ef | grep java | grep ZK
}

sbts () {
 ps -ef | grep java | grep sbt
}

