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
# [*set_default*]
#   Set bash instead of dash as default shell (only $::ostype==Debian)
#   *Optional* (defaults to false)
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
  $prompt      = $bash::params::prompt,
  $root_prompt = $bash::params::root_prompt,
  $set_default = false,
) inherits bash::params {

  validate_hash($aliases)
  validate_string($prompt)
  validate_string($root_prompt)
  validate_bool(str2bool($set_default))

  contain bash::install
  contain bash::config

  Class['bash::install']
  -> Class['bash::config']

  if str2bool($set_default) {
    contain bash::default_shell

    Class['bash::config']
    -> Class['bash::default_shell']
  }

}
