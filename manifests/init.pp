# Basic shell managment
class shell(
  $user=false,
  String $home='',
  String $include=''
) {

  include shell::params
  include git

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
