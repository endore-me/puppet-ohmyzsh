# == Define: user
#
# === Parameters
#
# [*username*]
#   if not set title will be used
#
# [*home*]
#   _required_ homedirectory of the user
#
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
  if ( $username != 'root' ) {
    exec { "chsh -s ${path} ${username}":
      unless => "grep -E '^${username}.+:${$path}$' /etc/passwd",
      path   => ['/bin', '/usr/bin'],
    }
    file { "${home}/.zshrc":
      ensure  => $ensure,
      replace => false,
      content => template('ohmyzsh/zshrc.erb'),
      owner   => $username,
      group   => $username,
    }
  }
}
