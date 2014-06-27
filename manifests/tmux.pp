# Tmux setup
class shell::tmux {

  include git

  package {'tmux':
    ensure  => installed
  }

  git::clone {'.tmux':
    url   => 'git://github.com/narkisr/.tmux.git',
    dst   => "${shell::home}/.tmux",
    owner => $shell::user
  }

  file {"${shell::home}/.tmux.conf":
    ensure  => link,
    target  => "${shell::home}/.tmux/.tmux.conf",
    require => Git::Clone['.tmux']
  }

  package{'tmuxinator':
    ensure   => present,
    provider => gem
  } ->

  git::clone {'.tmuxinator':
    url   => 'git://github.com/narkisr/.tmuxinator.git',
    dst   => "${shell::home}/.tmuxinator",
    owner => $shell::user
  }
}
