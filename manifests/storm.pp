# setting up https://github.com/emre/storm
class shell::storm($owner='root') {

  ensure_resource('class', 'python', {
    version    => 'system',
    dev        => true,
    virtualenv => true,
    gunicorn   => false,
    pip        => true
  })

  python::virtualenv { '/var/stormssh':
    ensure       => present,
    version      => 'system',
    systempkgs   => true,
    distribute   => false,
    cwd          => '',
    timeout      => 0,
  } ->

  python::pip { 'stormssh':
    pkgname    => 'stormssh',
    virtualenv => '/var/stormssh',
    owner      => $owner
  }
}
