# Class: nodejs_app
# ===========================
#
# Full description of class nodejs_app here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class nodejs_app (
  $package_name = $::nodejs_app::params::package_name,
  $service_name = $::nodejs_app::params::service_name,
) inherits ::nodejs_app::params {

  # validate parameters here

  class { '::nodejs_app::install': } ->
  class { '::nodejs_app::config': } ~>
  class { '::nodejs_app::service': } ->
  Class['::nodejs_app']
}
