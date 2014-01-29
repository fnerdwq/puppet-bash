# configures bash with some nice defaults (private)
class bash::config {

  file {'/etc/profile.d/prompt.sh':
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => template('bash/prompt.sh.erb'),
  }

  file {'/etc/profile.d/aliases.sh':
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => template('bash/aliases.sh.erb'),
  }

}
