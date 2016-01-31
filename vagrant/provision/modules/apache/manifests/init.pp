class apache {
    package { ['apache2']:
        ensure => present,
        require => Exec['aptget_update'];
    }

    service { 'apache2':
      ensure  => running,
      require => Package['apache2'];
    }

    file {'/etc/apache2/sites-enabled/000-default.conf':
        ensure => absent,
        require => Package['apache2'],
        notify => Service['apache2'];
    }

    file {'/etc/apache2/sites-enabled/scratch.conf':
        source => 'puppet:///modules/apache/scratch.conf',
        require => Package['apache2'],
        notify => Service['apache2'];
    }

    exec {'enable_rewrite':
        command => '/usr/sbin/a2enmod rewrite',
        require => Package['apache2'],
        notify => Service['apache2'],
        unless => "/usr/bin/find /etc/apache2/mods-enabled/rewrite.load";
    }
}
