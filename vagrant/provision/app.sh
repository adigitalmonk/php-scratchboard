#!/usr/bin/env bash

echo "Provisioning App."

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