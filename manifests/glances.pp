#  Sets up glances (https://github.com/nicolargo/glances)
class shell::glances {

  # Enabling more info
  package{'lm-sensors':
    ensure  => present
  }

  package{'glances':
    ensure   => installed
  }
}
