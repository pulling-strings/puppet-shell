# manages zsh_configuration
class shell::oh_my_zsh {

  include git

  $home = "/home/${username}"

  git::clone {'oh-my-zsh':
    url   => 'git://github.com/narkisr/oh-my-zsh.git',
    dst   => "${home}/.oh-my-zsh",
    owner => $username
  }

  file { "${home}/.zshrc":
    ensure => link,
    target => "${home}/.oh-my-zsh/.zshrc",
    require  => Exec['clone oh-my-zsh']
  }

  file { "${home}/.oh-my-zsh":
    group    => $username,
    owner    => $username,
    mode     => '0644',
    require  => Exec['clone oh-my-zsh']
  }

}
