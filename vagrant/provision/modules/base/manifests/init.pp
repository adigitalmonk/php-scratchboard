# Initial config for app VM

class base {

    exec {'aptget_update':
        command => '/usr/bin/apt-get update';
    }

    host {'app':
        ip => '10.10.2.20';
    }

    package {[
            'build-essential',
            'python-software-properties',
            'curl',
            'vim'
        ]:
        require => Exec['aptget_update'],
        ensure => present;
    }
}
