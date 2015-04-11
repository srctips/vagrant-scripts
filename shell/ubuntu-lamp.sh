#!/bin/bash

apt-get update
apt-get upgrade -y


export DEBIAN_FRONTEND=noninteractive
apt-get install -y apache2 apache2-utils nano git unzip
apt-get install -y php5 php-pear libapache2-mod-php5 php5-dev php5-gd libssh2-php php5-mcrypt dbconfig-common
apt-get install -y mysql-server php5-mysql
apt-get install -y phpmyadmin

