class php {

    exec {'add-php-repo':
        command => '/usr/bin/add-apt-repository -y ppa:ondrej/php5 && /usr/bin/apt-get update -qq',
        unless => '/bin/grep -h "ondrej/php5" /etc/apt/sources.list.d/*',
        require => Package['python-software-properties'];
    }

    package {[
            'php5',
            'php5-cli',
            'php5-curl',
            'libapache2-mod-php5',
            'php5-imagick',
            'php5-memcache',
            'php5-mysql',
            'php5-xdebug',
            'phpunit'
        ]:
        ensure => present,
        require => [Exec['add-php-repo'], Exec['aptget_update']],
        notify => Service['apache2'];
    }

    # Composer!
    exec {'add-php-composer':
        command => '/usr/bin/curl -sS https://getcomposer.org/installer | /usr/bin/php -- --install-dir=/usr/bin --filename=composer',
        unless => '/usr/bin/find /usr/bin/composer',
        require => Package['curl', 'php5-cli'];
    }

    # Set up the composer stuff for the project
    exec {'run-composer':
        command => '/usr/bin/composer install',
        cwd => '/var/www/',
        creates => '/var/www/vendor/',
        require => Exec['add-php-composer'];
    }
}
