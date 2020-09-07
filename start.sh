#!/bin/bash

mkdir /home/update_web
cd /home/update_web
git init
git pull https://github.com/amchakra-hive/roger-skyline.git 
rm -rf  /var/www/html 
cp -R /home/update_web/ /var/www/html/
echo "ServerName \"http://192.168.99.100/\"" >> /etc/apache2/apache2.conf
service apache2 start