# Setting up ack-grep
class shell::ack {

  package{'ack-grep':
    ensure  => present
  }

  shell::link_dot{'.ackrc':}

  file{'/usr/bin/ack':
    ensure  => link,
    target  => '/usr/bin/ack-grep',
    require => Package['ack-grep']
  }
}
