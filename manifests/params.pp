# set flavor specific variables (private)
class bash::params {

  case $::osfamily {
    'Debian': {
      $prompt      = '\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]$ '
      $root_prompt = '\[\033[01;31m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]# '
    }
    'RedHat': {
      $prompt      = '[\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]]$ '
      $root_prompt = '[\[\033[01;31m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]]# '
    }
    default:  {
      fail("Module ${module_name} is not supported on ${::operatingsystem}/${::osfamily}")
    }
  }
}
