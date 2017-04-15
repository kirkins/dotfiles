node default {

  include tmux    # background bash windows
  include vim     # text editor

  # packages to install
  $packages = [ 
    'i3-wm',      # window manager
    'jq',         # formatting json
    'gimp',       # image editing
    'git',        # version control
    'nmap',       # port scanning
    'virtualenv', # manage python dependencies
    'python-pip', # python pakcage management
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

  # customize i3-wm
  file { '/etc/i3/config':
    ensure => present,
  }->
  file_line { 'use mod+tab to cycle workspaces':
    path => '/etc/i3/config',
    line => 'bindsym $mod+Tab workspace next',
  }

}
