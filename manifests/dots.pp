# dots setup
class shell::dots {

  $dots_home = "${home}/.dots"

  $dots_repo = 'git://github.com/narkisr/dots.git'

  git::clone { $dots_home:
    url   => $dots_repo,
    dst   => $dots_home,
    owner => $username
  }

}
