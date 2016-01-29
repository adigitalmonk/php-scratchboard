#!/usr/bin/env bash

echo "--------------------"
echo "- Provisioning App -"
echo "--------------------"

echo "... Updating APT"
    apt-get update -qq

echo "... Installing build packages"
    apt-get install -qq build-essential python-software-properties

echo "... PHP5 PPA"
    grep -h "ondrej/php5" /etc/apt/sources.list.d/* > /dev/null 2>&1
    if [ $? -ne 0 ]
    then
        echo "... ... Adding ppa:ondrej/php5"
        add-apt-repository -y ppa:ondrej/php5
        apt-get update -qq
    fi

echo "... PHP"
    apt-get install -qq php5 php5-xdebug phpunit

echo "... CURL"
    apt-get install -qq curl

echo "... Composer"
    find /usr/bin/composer > /dev/null 2>&1
    if [ $? -ne 0 ]
    then
        echo "... ... Adding Composer"
        curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
    fi

echo "... PHP XDebug"
    apt-get install -qq php5-xdebug phpunit

echo "... PHP phpunit"
    apt-get install -qq  phpunit

echo "... Porting Apache Configs"
    find /etc/apache2/sites-enabled -maxdepth 1 -type l -exec rm -f {} \;
    rm /etc/apache2/sites-enabled/*
    cp /var/www/apache/* /etc/apache2/sites-enabled/

# echo "... MySQL + PHP Module"
    # apt-get install -qq mysql-server mysql-client php5-mysql

# find /var/opt/mysql-configured > 2>&1
# if [ $? -ne 0 ]
# then
    # echo "... MySQL Configuration"
    # touch /var/opt/mysql-configured
# fi

echo "... Enable Mod_Rewrite"
    a2enmod rewrite > /dev/null 2>&1

echo "... Restarting services"
    service apache2 restart
