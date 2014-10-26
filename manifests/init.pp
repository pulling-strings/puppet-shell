# Basic shell managment
class shell($user=false, $home=false) {

  include shell::params
  validate_string($user)
  validate_string($home)

  case $::osfamily {
    'Debian': {
      include shell::debian
    }
    'Freebsd': {
      include shell::freebsd
    }
    default: {
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }
  }
}
