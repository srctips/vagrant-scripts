#!/bin/bash
service mysql start

mysqladmin -u root create joomla_demo
mysql -u root joomla_demo <<SCRIPT
CREATE USER 'dbadmin'@'localhost' IDENTIFIED BY 'Sup3rS3cr3t';
GRANT ALL PRIVILEGES ON joomla_demo.* TO 'dbadmin'@'localhost';
FLUSH PRIVILEGES;
SCRIPT

cd /tmp
wget http://joomlacode.org/gf/download/frsrelease/20021/162256/Joomla_3.4.1-Stable-Full_Package.tar.gz
tar -xvzf Joomla_3.4.1-Stable-Full_Package.tar.gz -C /var/www/html
sudo rm /var/www/html/index.html

cat >> /var/www/html/info.php <<SCRIPT
<?php
phpinfo();
?>
SCRIPT

chown -R www-data /var/www/html
chgrp -R www-data /var/www/html
chmod -R g+w /var/www/html
chmod g+s /var/www/html

service mysql restart
service apache2 restart