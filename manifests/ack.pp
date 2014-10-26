# Setting up ack-grep
class shell::ack {

  package{$shell::params::ack_pkg:
    ensure  => present
  }

  shell::link_dot{'.ackrc':}

  if($::osfamily == 'Debian'){
    file{'/usr/bin/ack':
      ensure  => link,
      target  => '/usr/bin/ack-grep',
      require => Package['ack-grep']
    }
  }
}
