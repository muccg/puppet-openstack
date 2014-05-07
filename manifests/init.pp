class openstack {
  class { 'repo::ubuntucloud': }

  @package { 'python-keystone':
    ensure => present,
  }

  @package { 'python-mysqldb':
    ensure => present,
  }

  @package {'python-memcache':
    ensure => installed,
  }

}
