node default {

  include nvm     # node version manager
  include tmux    # background bash windows
  include vim     # text editor
  include i3      # window manager

  # packages to install
  $packages = [ 
    'jq',         # formatting json
    'gimp',       # image editing
    'git',        # version control
    'nmap',       # port scanning
    'virtualenv', # manage python dependencies
    'python-pip', # python pakcage management
    'curl',       # for api requests
    'ranger',     # for file system navigation
    'traceroute', # trace traffic route
    'iftop',      # monitor network usage by ip
    'iotop',      # monitor io usage
  ]

  package { $packages: ensure => installed }

  # TODO put all changes into a single file and append it (?)
  # ^ issue, would lose useful distro defaults
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
  }->
  file_line { 'cx alias to chmod+x':
    path => '/etc/bash.bashrc',
    line => 'alias cx="chmod a+x $1"',
    match => 'alias cx=.*$',
  }

}
