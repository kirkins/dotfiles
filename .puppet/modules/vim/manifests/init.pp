class vim {

  Package { 'vim':
    ensure      => installed,
  }

  file { '/etc/vim/vimrc':
    source      => 'puppet:///modules/vim/.vimrc',
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

  exec { 'load vim plugins':
    command     => 'vim +PluginInstall +qall',
    path        => '/usr/bin/:/bin/bash/',
    environment => "HOME=/root"
  }

}
