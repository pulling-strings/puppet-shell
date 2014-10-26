# Shell setup for freebsd
class shell::freebsd {
  include shell::zsh
  include shell::oh_my_zsh
  include shell::tmux
  include shell::dots
}
