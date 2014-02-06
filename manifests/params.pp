# set flavor specific variables (private)
class bash::params {

  case $::osfamily {
    'Debian': {
      $prompt      = '\[\033[01;32m\]\u@\h\[\033[0m\]:\[\033[01;34m\]\W\[\033[0m\]$ '
      $root_prompt = '\[\033[01;31m\]\u@\h\[\033[0m\]:\[\033[01;34m\]\W\[\033[0m\]# '
    }
    'RedHat': {
      $prompt      = '[\[\033[01;32m\]\u@\h\[\033[0m\] \[\033[01;34m\]\W\[\033[0m\]]$ '
      $root_prompt = '[\[\033[01;31m\]\u@\h\[\033[0m\] \[\033[01;34m\]\W\[\033[0m\]]# '
    }
    default:  {
      fail("Module ${module_name} is not supported on ${::operatingsystem}/${::osfamily}")
    }
  }
}
