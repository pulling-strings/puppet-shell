# Basic shell managment
class shell(
  $user=false,
  $home=false,
  $include = true
) {

  include shell::params
  include git
  validate_string($user)
  validate_string($home)

  if $include {
    case $::osfamily {
      'Debian': {
        include shell::debian
      }
      'FreeBSD': {
        include shell::freebsd
      }
      default: {
        fail("Module ${module_name} is not supported on ${::osfamily}")
      }
    }
  }
}
