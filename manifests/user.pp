define ohmyzsh::user (
  $username = $title,
  $ensure   = present,
  $path     = '/usr/bin/zsh',
  $theme    = 'eastwood',
  $home     = undef,
  $plugins  = [
    'git', 'rails', 'rails3', 'rbenv', 'ruby', 'debian', 'rake', 'tmux',
    'bundler'
  ]
) {
  exec { "chsh -s $path $username":
    unless => "grep -E '^${username}.+:${$path}$' /etc/passwd",
    path   => ['/bin', '/usr/bin'],
  }
  if ( $username != "root" ) {
    file { "$home/.zshrc":
      ensure  => present,
      replace => false,
      content => template('ohmyzsh/zshrc.erb'),
      owner   => $username,
      group   => $username,
    }
  }
}
