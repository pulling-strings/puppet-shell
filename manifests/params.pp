# Misc params per operating system family
class shell::params {
  case $::osfamily {
    'Debian': {
      $zsh_bin = '/bin/zsh'
      $ack_pkg = 'ack-grep'
      $opt_path = '/opt'
    }
    'FreeBSD': {
      $zsh_bin = '/usr/local/bin/zsh'
      $ack_pkg = 'p5-ack'
      $opt_path= '/usr/local/opt'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }
  }

}
