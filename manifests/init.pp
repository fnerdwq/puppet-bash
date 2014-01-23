# initial bash class
# works on debian and centos
class bash {

  package {['bash', 'bash-completion']: ensure => installed }

  file {'/etc/profile.d/prompt.sh':
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet://modules/bash/prompt.sh',
    require => Package['bash'],
  }

  # TODO: make template
  file {'/etc/profile.d/custom_aliases..sh':
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet://modules/bash/custom_aliases.sh',
    require => Package['bash'],
  }

}
