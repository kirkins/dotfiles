node default {

  include nvm     # node version manager
  include tmux    # background bash windows
  include vim     # text editor
  include i3      # window manager
  include nvm     # node version manager 

  # packages to install
  $packages = [ 
    'curl',       # for api requests
    'gimp',       # image editing
    'git',        # version control
    'iftop',      # monitor network usage by ip
    'iotop',      # monitor io usage
    'jq',         # formatting json
    'nmap',       # port scanning
    'python-pip', # python pakcage management
    'ranger',     # for file system navigation
    'traceroute', # trace traffic route
    'virtualenv', # manage python dependencies
  ]

  package { $packages: ensure => installed }

  # changes to .bashrc
  file { '/etc/bash.bashrc':
    ensure => present,
  }->
  file_line { 'alias vi to vim':
    path => '/etc/bash.bashrc',  
    line => 'alias vi=vim',
  }->
  file_line { 'update history memory':
    path => '/etc/bash.bashrc',  
    line => 'HISTFILESIZE=20000',
    match => 'HISTFILESIZE=.*$',
  }->
  file_line { 'update history line count':
    path => '/etc/bash.bashrc',  
    line => 'HISTSIZE=10000',
    match => 'HISTSIZE=.*$',
  }->
  file_line { 'dont store duplicate lines in history':
    path => '/etc/bash.bashrc',  
    line => 'HISTCONTROL=ignoreboth',
    match => 'HISTCONTROL=.*$',
  }

}
