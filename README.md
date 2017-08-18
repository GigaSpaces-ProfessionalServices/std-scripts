Scripts for running XAP from the datacenter for the demo at https://github.com/GigaSpaces-ProfessionalServices/imc-pi

For demo purposes, our datacenter is the laptop powering the PI robot army.

## Warnings

These scripts have been modified to on OSX... 
With build gigaspaces-xap-premium-12.2.0-m9-b18010, there is a problem booting webui...

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
