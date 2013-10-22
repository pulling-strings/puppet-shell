# zsh
class shell::zsh {

  package {'zsh':
    ensure => installed
  }
  
  exec {'default shell':
   command     => "chsh -s /bin/zsh $username", 
   path        => ['/usr/bin/','/bin/'],
   require     => Package["zsh"],
   user        => root, 
   refreshonly => true,
   subscribe   =>  Package['zsh']
  }
}
