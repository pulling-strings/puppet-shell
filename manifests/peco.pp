# Setting up peco
class shell::peco {
  $home = hiera('home')
  validate_string($home)

  ensure_resource('file', "${home}/bin", {'ensure' => 'directory'})

  $version = 'v0.2.0'
  $url =  "https://github.com/peco/peco/releases/download/${version}/peco_linux_amd64.tar.gz"

  archive {'peco-parent':
    ensure        => present,
    url           => $url,
    digest_string => '954317087214c9ef2e0b1717c21438dc' ,
    src_target    => '/usr/src',
    target        => "${home}/bin/",
    strip_components => 1
  }

  file{"${home}/bin/peco":
    ensure => link,
    target => "${home}/bin/peco-parent/peco"
  }



}
