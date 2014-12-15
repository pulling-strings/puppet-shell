# zsh
class shell::zsh {

  package {'zsh':
    ensure => installed
  } ~>
  
  exec {'default shell':
   command => "chsh -s ${shell::params::zsh_bin} ${shell::user}", 
   path    => ['/usr/bin/','/bin/'],
   require => Package['zsh'],
   user    => root,
   unless  => "cat /etc/passwd | grep ${shell::user} | grep zsh"
  }
}
