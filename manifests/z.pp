# z shortcut
class shell::z {

  git::clone {'z':
    url   => 'git://github.com/narkisr/z.git',
    dst   => '/opt/z',
    owner => $username
  }
}
