class nginx {
    package { ['nginx']:
        ensure => present,
        require => Exec['aptget_update'];
    }

    service { 'nginx':
      ensure  => running,
      require => Package['nginx'];
    }

    file {'/etc/nginx/sites-enabled/default':
        ensure => absent,
        require => Package['nginx'],
        notify => Service['nginx'];
    }

    file {'/etc/nginx/sites-enabled/scratch':
        source => 'puppet:///modules/nginx/scratch.conf',
        require => Package['nginx'],
        notify => Service['nginx'];
    }
}
