# installs bash and related packages (private)
class bash::install {

  if $::osfamily == 'RedHat' {
    include 'epel'
    Class['epel'] ->
    Package['bash-completion']
  }

  package { ['bash', 'bash-completion']:
    ensure => installed
  }

}
