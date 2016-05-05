# == Class nodejs_app::install
#
# This class is called from nodejs_app for install.
#
class nodejs_app::install {

  package { $::nodejs_app::package_name:
    ensure => present,
  }
}
