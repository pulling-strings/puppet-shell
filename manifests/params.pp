# Misc params per operating system family
class shell::params {
  case $::osfamily {
    'Debian': {
      $zsh_bin= '/bin/zsh'
      $ack_pkg= 'ack-grep'
    }
    'FreeBSD': {
      $zsh_bin= '/usr/local/bin/zsh'
      $ack_pkg= 'ack'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }
  }

}
