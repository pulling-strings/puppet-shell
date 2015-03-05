# Debian shell setup
class shell::debian {
  include shell::dots
  include shell::zsh
  include shell::oh_my_zsh
  include shell::z
  include shell::ack
  include shell::rlwrap
  include shell::tmux
  include shell::transcrypt
  include shell::icdiff
  include shell::fzf

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
