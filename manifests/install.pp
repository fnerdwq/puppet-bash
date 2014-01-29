# installs bash and related packages (private)
class bash::install {

  package { ['bash', 'bash-completion']:
    ensure => installed
  }

}
