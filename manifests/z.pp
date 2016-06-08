# z shortcut
class shell::z {

  ensure_resource('file',$shell::params::opt_path,{ensure => directory})

  git::clone {'z':
    url   => 'git://github.com/narkisr/z.git',
    dst   => "${shell::params::opt_path}/z",
    owner => $shell::user
  }
}
