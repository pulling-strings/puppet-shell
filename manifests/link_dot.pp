# defining link to a dot file
define shell::link_dot() {
  include shell::dots

  file{"${shell::home}/${name}":
    ensure  => link,
    target  => "${shell::dots::dots_home}/${name}",
    require => Git::Clone[$shell::dots::dots_home]
  }
}

