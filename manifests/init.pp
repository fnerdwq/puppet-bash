# == Class: bash
#
# This class installs and configures bash.
#
# This works on Debian and RedHat like systems.
# Puppet Version >= 3.4.0
#
# === Parameters
#
# [*aliases*]
#   A hash of custom global aliases to set.
#   *Optional* (defaults to some usefull settings for ls)
#
# [*prompt*]
#   Globally set the default prompt for non-root users (PS1).
#   *Optional* (defaults to a nice green one)
#
# [*root_prompt*]
#   Globally set the default prompt for root (PS1).
#   *Optional* (defaults to a nice red one)
#
# === Examples
#
# include bash
#
# === Authors
#
# Frederik Wagner <wagner@wagit.de>
#
# === Copyright
#
# Copyright 2014 Frederik Wagner
#
class bash (
  $aliases     = {
    'ls' => 'ls --color=auto',
    'll' => 'ls -lha',
  },
  $prompt      = '[\u@\h \[\033[01;34m\]\W\[\033[00m\]]# ',
  $root_prompt = '[\[\033[01;31m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]]# ',
) {

  validate_hash($aliases)
  validate_string($prompt)
  validate_string($root_prompt)

  class {'bash::install': }
  -> class {'bash::config': }

}
