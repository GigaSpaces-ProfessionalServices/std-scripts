Working customer-like scripts, standardized for usage across professional services and support.

#### Benefits

##### Environment portability 

Ops teams frequently copy previous teams' installation directory to a new environment or set of environments belonging to the 'new' team as XAP use expands

##### Log management

System archives XAP and gc logs per restart. Log directories contain only the information for the current system runtime, simplifying debugging.

##### Three step upgrades (assuming no configuration changes in the product, which still must be dealt with on a case by case basis):

1. Unzip into BASE_DIR
2. `cd $BASE_DIR ; mkdir logs ; mkdir gclogs`
3. `cd $XAP_HOME ; mv config config.factory ; ln -s ../config . ; mv logs logs.factory ; ln -s ../logs . ; cp /path/to/xap-license.txt .` # all configuration must be moved to BASE_DIR at time of upgrade

##### One-top config

(Almost) all configuration is in $XAP_HOME/scripts/project-env-settings.sh

#### Limitations

1. XAP 12.1 
2. Grafana montoring not implemented
3. XAP Manager not implementated
4. Upgrades still require careful analysis for things like gs.properties, config/log/xap_logging_ext.properties and many others
5. WEB UI log is not archived like the other logs

#### Algorithm

```bash
% mkdir $BASE_DIR # conventionally /opt/xap
% cd $BASE_DIR
% mkdir deploy work security scripts logs gclogs
# unzip new XAP version (upgrade to)
% cd [new xap location // directory created by unzip] 
% cp [license file loc] .
% mv config config.factory
% mv logs logs.factory
% ln -s ../logs .
% cp -r config ..
% ln -s ../config .
% cd $BASE_DIR/scripts
# copy reference scripts to $BASE_DIR/scripts
% vi project-env-settings.sh
# change LOOKUP settings
% cd $BASE_DIR
% ln -s $XAP_HOME current
% ./start-xap.sh
# debug...
```
