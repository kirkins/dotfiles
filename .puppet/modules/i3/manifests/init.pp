class i3 {

  Package { 'i3':
    ensure => installed,
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
