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
  } ->

  file{"${shell::home}/.tmux/plugins":
    ensure => directory,
    owner => $shell::user,
  } ->

  git::clone {'tpm':
    url   => 'git://github.com/tmux-plugins/tpm',
    dst   => "${shell::home}/.tmux/plugins/tpm",
    owner => $shell::user
  } ->

  file {"${shell::home}/.tmux.conf.plugins":
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
