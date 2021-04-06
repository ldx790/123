#/bin/bash
echo "开始安装MySQL"
yum -y install mariadb mariadb-server mariadb-libs mariadb-devel
echo "MYSQL安装成功"
systemctl start mariadb #启动数据库
systemctl enable mariadb #设置开机重启
echo "开始安装APache"
yum -y install httpd httpd-devel
echo "APache安装成功"
systemctl start httpd
systemctl enable httpd
echo "开始安装PHP"
yum -y install php php-mysql php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel php-bcmath
echo "PHP安装成功"
systemctl restart httpd
systemctl stop firewalld
echo "验证LAMP"
echo "<?php phpinfo();?>" > /var/www/html/test.php
echo "开始安装CRM"
cd /var/www/html
tar -zxvf /var/www/html/crm.tar.gz
chmod -R 777 /var/www/html/crm
echo "CRM安装成功"
