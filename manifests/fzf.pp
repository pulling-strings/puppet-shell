# Setting up https://github.com/junegunn/fzf
class shell::fzf {
  git::clone {'fzf':
    url   => 'https://github.com/junegunn/fzf.git',
    dst   => "${shell::home}/.fzf",
    owner => $shell::user
  } ->
  
  exec{'install fzf':
    command     => "${shell::home}/.fzf/install",
    environment => ["HOME=${shell::home}"],
    user        => $shell::user,
    path        => ['/usr/bin','/bin',]
  }
}
