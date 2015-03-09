# Setting up https://github.com/junegunn/fzf
class shell::fzf {
  validate_string($::shell::home)
  git::clone {'fzf':
    url    => 'https://github.com/junegunn/fzf.git',
    dst    => "${::shell::home}/.fzf",
    owner  => $shell::user,
    unless => "test -d ${::shell::home}/.fzf"
  } ->
  
  exec{'install fzf':
    command     => "${shell::home}/.fzf/install",
    environment => ["HOME=${shell::home}"],
    user        => $shell::user,
    path        => ['/usr/bin','/bin',]
  }
}
