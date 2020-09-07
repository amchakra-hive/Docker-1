#!/bin/bash

if [ ! -d "/home/update_web" ]; then
    mkdir /home/update_web
fi
cd /home/update_web
if [ ! -d "/home/update_web/.git" ]; then
    git init
fi
git pull https://github.com/amchakra-hive/roger-skyline.git > temp
gitcheck=$(cat temp)
if [ "$gitcheck" == "Already up to date." ]; then
    rm temp
    exit

else
    rm temp
    rm -rf /var/www/html_old
    mv  /var/www/html /var/www/html_old
    cp -R /home/update_web/ /var/www/html/
    logfile='/home/deploy_script.log'
    echo -e "-------------------------------" >> $logfile
    echo -e "\nThe time of the last update:\nTime: $(date "+ %Y-%m-%d  %H:%M:%S")\n" >> $logfile
fi

service apache2 start