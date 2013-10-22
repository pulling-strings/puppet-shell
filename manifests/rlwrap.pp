# rlwrap setup
class shell::rlwrap {
  package{'rlwrap':
    ensure  => present
  }

  dots::link_dot{'.inputrc':}
}
