class tmux {

  Package { 'tmux':
    ensure => installed,
  }

  file { '/etc/tmux.conf':
    source => 'puppet:///modules/tmux/tmux.conf',
    owner => 'root',
    group => 'root',
    mode => '0644',
  }
}
