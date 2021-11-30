#!/bin/bash
ver=`curl --silent http://mirror.vorboss.net/apache/tomcat/tomcat-9/ | grep v9 | awk '{split($5,c,">v") ; split(c[2],d,"/") ; print d[1]}'`
echo $ver
version=`echo $ver | cut -d " " -f2`
echo $version
sudo apt update
sudo apt install -y default-jdk wget git
cd /home/$USER/
sudo mkdir tomcat${version}
cd /home/$USER/tomcat${version}
sudo rm -rf apache*
sudo wget https://downloads.apache.org/tomcat/tomcat-9/v${version}/bin/apache-tomcat-${version}.tar.gz
sudo tar -xvzf apache-tomcat-9.*
sudo rm -rf apache*.gz
sudo chmod -R 755 /home/$USER/tomcat${version}/apache-tomcat-9.*
sudo rm -rfv /home/$USER/tomcat${version}/apache-tomcat-9.*/webapps/manager/META-INF/context.xml
sudo rm -rfv /home/$USER/tomcat${version}/apache-tomcat-9.*/webapps/host-manager/META-INF/context.xml
sudo rm -rfv /home/$USER/tomcat${version}/apache-tomcat-9.*/conf/tomcat-users.xml
sudo cp context.xml /home/$USER/tomcat${version}/apache-tomcat-9.*/webapps/manager/META-INF/context.xml
sudo cp context.xml /home/$USER/tomcat${version}/apache-tomcat-9.*/webapps/host-manager/META-INF/context.xml
sudo cp tomcat-users.xml /home/$USER/tomcat${version}/apache-tomcat-9.*/conf/tomcat-users.xml
cd /home/$USER/tomcat${version}/apache-tomcat-9.*
sudo sh bin/startup.sh
echo "username: admin"
echo "password: goodvibes"
