# defining link to a dot file
define shell::link_dot() {
  file{"${home}/${name}":
    ensure  => link,
    target  => "${dots::dots_home}/${name}",
    require => Git::Clone[$dots::dots_home]
  }
}

