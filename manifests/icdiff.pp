# Setting up https://github.com/jeffkaufman/icdiff
class shell::icdiff {
  git::clone { 'icdiff':
    url   => 'git://github.com/jeffkaufman/icdiff.git',
    dst   => '/opt/icdiff',
    owner => $shell::user
  } ->

  file{'/usr/bin/icdiff':
    ensure => link,
    target => '/opt/icdiff/icdiff'
  }
}
