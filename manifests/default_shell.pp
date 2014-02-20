# reconfigure dash to set bash default on Debian like systems (private)
class bash::default_shell {

  if $::osfamily == 'Debian'{

    ensure_resource ('file', '/var/local/debconf', {'ensure' => 'directory'})

    file { '/var/local/debconf/dash.preseed':
      content => "dash\tdash/sh\tboolean\tfalse\n",
      mode    => '0600',
      backup  => false,
      notify  => Exec['update-dash'],
    }

    exec { 'update-dash':
      command     => 'debconf-set-selections < /var/local/debconf/dash.preseed && \
        dpkg-reconfigure --frontend=noninteractive dash',
      refreshonly => true,
      path        => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    }

  } else {
    warn('default shell can only be set for Debian like systems')
  }
}
