class openstack {

  @package { 'python-keystone':
    ensure => present,
  }

  @package { 'python-mysqldb':
    ensure => present,
  }

  @package {'python-memcache':
    ensure => installed,
  }

  if $lsbdistcodename == 'precise' {
    package {'ubuntu-cloud-keyring':
      ensure => installed,
    }

    file {ubuntu-cloud-archive-repo:
      path    => '/etc/apt/sources.list.d/ubuntu-cloud-archive.list',
      content => template('openstack/ubuntu-cloud-archive.list.erb'),
      notify  => Exec[apt-get-update],
      require => Package['ubuntu-cloud-keyring'],
    }
  }
}
