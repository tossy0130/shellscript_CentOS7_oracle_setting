#!/bin/sh

############## PHP & Apacheインストール


###### Apache インストール
sudo yum -y install httpd


######　ファイヤーウォール設定
sudo yum -y install firewalld

firewall-cmd --zone=public --add-port=5500/tcp --permanent
firewall-cmd --zone=public --add-port=1521/tcp --permanent

firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=httpd

firewall-cmd -reload


###### PHP7.x インストール

yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

yum -y install --enablerepo=remi,remi-php72 php php-mbstring php-xml php-xmlrpc php-gd php-pdo php-pecl-mcrypt php-mysqlnd php-pecl-mysql

### php.ini 設定

sed -i -e "s/;error_log = php_errors.log/error_log =\/var\/log\/php_err.log/g" /etc/php.ini -e 's/date.timezone =/date.timezone = "Asia\/Tokyo" = /g' /etc/php.ini -e "s/display_errors = Off/display_errors = On/g" /etc/php.ini

### info.php 作成

cat <<- EOT > /var/www/html/info.php
  <?php 
	phpinfo();
  ?>
EOT


###### Oracle Instant Client 系 インストール

sudo yum -y install gcc
sudo yum -y install gedit

###### oracle client用　格納ディレクトリ作成
mkdir /opt/oracle





