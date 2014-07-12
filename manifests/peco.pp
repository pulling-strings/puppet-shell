# Setting up peco
class shell::peco {

  $version = 'v0.2.0'
  $url =  "https://github.com/peco/peco/releases/download/${version}/peco_linux_amd64.tar.gz"

  archive {'peco-parent':
    ensure        => present,
    url           => $url,
    digest_string => '954317087214c9ef2e0b1717c21438dc' ,
    src_target    => '/usr/src',
    target        => '/opt/',
    strip_components => 1
  }

  file{'/usr/local/bin/peco':
    ensure => link,
    target => '/opt/peco-parent/peco'
  }



}
