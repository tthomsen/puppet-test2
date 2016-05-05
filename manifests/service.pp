# == Class nodejs_app::service
#
# This class is meant to be called from nodejs_app.
# It ensure the service is running.
#
class nodejs_app::service {

  service { $::nodejs_app::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
