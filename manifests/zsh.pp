# zsh
class shell::zsh {

  package {'zsh':
    ensure => installed
  }
  
  exec {'default shell':
   command     => "chsh -s /bin/zsh ${shell::user}", 
   path        => ['/usr/bin/','/bin/'],
   require     => Package["zsh"],
   user        => root, 
   refreshonly => true,
   subscribe   =>  Package['zsh']
  }
}
