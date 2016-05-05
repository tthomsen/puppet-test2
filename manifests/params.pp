# == Class nodejs_app::params
#
# This class is meant to be called from nodejs_app.
# It sets variables according to platform.
#
class nodejs_app::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'nodejs_app'
      $service_name = 'nodejs_app'
    }
    'RedHat', 'Amazon': {
      $package_name = 'nodejs_app'
      $service_name = 'nodejs_app'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
