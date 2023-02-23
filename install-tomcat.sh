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
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.72/bin/apache-tomcat-9.0.72.tar.gz
sudo tar -xvzf apache-tomcat-9.*
sudo rm -rf apache*.gz
sudo chmod -R 755 /home/$USER/tomcat${version}/apache-tomcat-9.*
sudo rm -rfv /home/$USER/tomcat${version}/apache-tomcat-9.*/webapps/manager/META-INF/context.xml
sudo rm -rfv /home/$USER/tomcat${version}/apache-tomcat-9.*/webapps/host-manager/META-INF/context.xml
sudo rm -rfv /home/$USER/tomcat${version}/apache-tomcat-9.*/conf/tomcat-users.xml
sudo cp -v /home/$USER/tomcat-config-ubuntu/context.xml /home/$USER/tomcat${version}/apache-tomcat-9.*/webapps/manager/META-INF/
sudo cp -v /home/$USER/tomcat-config-ubuntu/context.xml /home/$USER/tomcat${version}/apache-tomcat-9.*/webapps/host-manager/META-INF/
sudo cp -v /home/$USER/tomcat-config-ubuntu/tomcat-users.xml /home/$USER/tomcat${version}/apache-tomcat-9.*/conf/
sudo rm -rf /home/$USER/tomcat-config-ubuntu
cd /home/$USER/tomcat${version}/apache-tomcat-9.*
sudo sh bin/startup.sh
echo "username: admin"
echo "password: admin"
sudo chown $USER:ubuntu /home/$USER/tomcat${version}
sudo chown $USER:ubuntu /home/$USER/tomcat${version}/apache-tomcat-9.*
