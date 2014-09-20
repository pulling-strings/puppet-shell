# Setting up http://www.fig.sh for docker managment
class shell::fig($owner='root'){
  ensure_resource('class', 'python', {
    version    => 'system',
    dev        => true,
    pip        => true
  })

  python::pip { 'fig':
    pkgname    => 'fig',
    owner      => $owner
  }
}
