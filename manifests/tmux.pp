# Tmux setup
class shell::tmux {

  include git

  package {'tmux':
    ensure  => installed
  }

  $home = "/home/${username}"

  git::clone {'.tmux':
    url   => 'git://github.com/narkisr/.tmux.git',
    dst   => "${home}/.tmux",
    owner => $username
  }

  file {"${home}/.tmux.conf":
    ensure  => link,
    target  => "${home}/.tmux/.tmux.conf",
    require => Git::Clone['.tmux']
  }

  package{'tmuxinator':
    ensure   => present,
    provider => gem
  } ->

  git::clone {'.tmuxinator':
    url   => 'git://github.com/narkisr/.tmuxinator.git',
    dst   => "${home}/.tmuxinator",
    owner => $username
  }
}
