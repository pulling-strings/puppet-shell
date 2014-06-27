# manages zsh_configuration
class shell::oh_my_zsh {

  include git

  git::clone {'oh-my-zsh':
    url   => 'git://github.com/narkisr/oh-my-zsh.git',
    dst   => "${shell::home}/.oh-my-zsh",
    owner => $shell::user,
  }

  file { "${shell::home}/.zshrc":
    ensure => link,
    target => "${shell::home}/.oh-my-zsh/.zshrc",
    owner => $shell::user,
    group => $shell::user,
    require  => Exec['clone oh-my-zsh']
  }

  file { "${shell::home}/.oh-my-zsh":
    group    => $shell::user,
    owner    => $shell::user,
    mode     => '0644',
    require  => Exec['clone oh-my-zsh']
  }

}
