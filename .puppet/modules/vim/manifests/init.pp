class vim {

  Package { 'vim':
    ensure => installed,
  }

  file { '/etc/vim/vimrc':
    source => 'puppet:///modules/vim/.vimrc',
    owner => 'root',
    group => 'root',
    mode => '0644',
  }
}
