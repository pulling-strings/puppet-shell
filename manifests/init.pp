# Basic shell managment
class shell($user=false, $home=false) {

  validate_string($user)
  validate_string($home)

  include shell::dots
  include shell::zsh
  include shell::oh_my_zsh
  include shell::z
  include shell::ack
  include shell::rlwrap
  include shell::tmux
  include shell::peco

  if(defined(Class['barbecue'])){
    package{'fasd':
      ensure   => present,
      require  => Class['barbecue']
    }
  }

  package{'nmon':
    ensure  => present
  }

}
