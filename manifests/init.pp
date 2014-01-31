# Basic shell managment
class shell {
  include shell::dots
  include shell::zsh
  include shell::oh_my_zsh
  include shell::z
  include shell::ack
  include shell::rlwrap
  include shell::tmux

  package{'fasd':
    ensure  => present,
    require  => Class['barbecue']
  }

  package{'nmon':
    ensure  => present
  }

}
