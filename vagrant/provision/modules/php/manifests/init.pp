class php {

    exec {'add-php-repo':
        environment => ['LC_ALL=C.UTF-8'],
        command => '/usr/bin/add-apt-repository -y ppa:ondrej/php && /usr/bin/apt-get update -qq',
        unless => '/bin/grep -h "ondrej/php" /etc/apt/sources.list.d/*',
        require => Package['python-software-properties'];
    }

    package {[
            'php7.0',
            'php7.0-fpm',
            'php7.0-cli',
            'php7.0-curl',
            'php-memcache',
            'php7.0-mysql',
            'php-xdebug',
        ]:
        ensure => present,
        require => [Exec['add-php-repo'], Exec['aptget_update']],
        notify => Service['nginx'];
    }

    service { 'php7.0-fpm':
      ensure  => running,
      require => Package['php7.0-fpm'];
    }

    file {'/etc/php/7.0/fpm/php.ini':
        source => 'puppet:///modules/php/php-fpm.ini',
        require => Package['php7.0-fpm'],
        notify => Service['php7.0-fpm'];
    }

    # Composer!
    exec {'add-php-composer':
        command => '/usr/bin/curl -sS https://getcomposer.org/installer | sudo /usr/bin/php -- --install-dir=/usr/bin --filename=composer',
        unless => '/usr/bin/find /usr/bin/composer',
        require => Package['curl', 'php7.0-cli'];
    }

    # Set up the composer stuff for the project
    exec {'run-composer':
        command => '/usr/bin/composer install',
        cwd => '/var/www/',
        creates => '/var/www/vendor/',
        require => Exec['add-php-composer'];
    }
}
