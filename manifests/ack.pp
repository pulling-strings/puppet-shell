# Setting up ack-grep
class shell::ack {

  package{$shell::params::ack_pkg:
    ensure  => present
  }

  shell::link_dot{'.ackrc':}
 
}
