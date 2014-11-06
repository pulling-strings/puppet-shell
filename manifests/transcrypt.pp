# in repo file encryption see
# https://github.com/elasticdog/transcrypt.git
class shell::transcrypt {

  $repo = 'git://github.com/elasticdog/transcrypt.git'

  ensure_resource('file',"${shell::home}/bin", {ensure => directory})

  git::clone { '/opt/transcrypt':
    url   => $repo,
    dst   => '/opt/transcrypt',
    owner => $shell::user
  } ->

  file{"${shell::home}/bin/transcrypt":
    ensure  => link,
    target  => '/opt/transcrypt/transcrypt',
    require => File["${shell::home}/bin"]
  }


}
