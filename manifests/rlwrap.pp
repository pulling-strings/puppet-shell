# rlwrap setup
class shell::rlwrap {
  package{'rlwrap':
    ensure  => present
  }

  shell::link_dot{'.inputrc':}
}
