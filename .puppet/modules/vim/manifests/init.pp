class vim {

  Package { 'vim':
    ensure      => installed,
  }

  file { '/etc/vim':
    ensure      => 'directory',
    owner       => 'root',
    group       => 'root',
    mode        => '0644',
  }

  file { '/etc/vim/bundle':
    ensure      => 'directory',
    owner       => 'root',
    group       => 'root',
    mode        => '0644',
  }

  file { '/etc/vim/bundle/Vundle.vim':
    ensure      => 'directory',
    source      => 'puppet:///modules/vim/Vundle.vim',
    recurse     => 'remote',
    owner       => 'root',
    group       => 'root',
    mode        => '0644',
  }

  # iterate through homedirs in fact array
  $facts['homedirs'].each |$homedir| {
    # copy file to home directory
    file { "/home/$homedir/.vimrc":
      ensure => 'file',
      source => 'puppet:///modules/vim/.vimrc',
    }
  }

  exec { 'load vim plugins':
    command     => 'vim +PluginInstall +qall',
    path        => '/usr/bin/:/bin/bash/',
    environment => "HOME=/root"
  }

}
