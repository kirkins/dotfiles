class nvm {
  file { '/opt/nvm/bin':
    ensure      => 'directory',
    owner       => 'root',
    group       => 'root',
    mode        => '0755',
  }

  file { '/opt/nvm/nvm.sh':
    source => 'puppet:///modules/nvm/nvm.sh',
    owner => 'root',
    group => 'root',
    mode => '0755',
  }

  exec { 'run nvm script':
    command => '/opt/nvm/nvm.sh',
    path    => '/usr/bin/:/bin/bash/',
    require =>  Package['git'],
  }

  # changes to .bashrc
  file_line { 'export nvm':
    path => '/etc/bash.bashrc',  
    line => 'export NVM_DIR="$HOME/.nvm"',
  }->
  file_line { 'load nvm':
    path => '/etc/bash.bashrc',  
    line => '[ -s "/opt/nvm/bin/nvm.sh" ] && . "/opt/nvm/bin/nvm.sh"',
  }

}
