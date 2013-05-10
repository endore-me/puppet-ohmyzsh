define ohmyzsh::user (
  $name    = $title,
  $ensure  = present,
  $path    = '/usr/bin/zsh',
  $theme   = 'eastwood',
  $plugins = [
    'git', 'rails', 'rails3', 'rbenv', 'ruby', 'debian', 'rake', 'tmux',
    'bundler'
  ]
) {
  #exec { "chsh -s $path $name":
  #  unless => "grep -E '^${name}.+:${$path}$' /etc/passwd",
  #  path   => ['/bin', '/usr/bin'],
  #}
  if ( $name != "root" ) {
    file { "$home/.zshrc":
      ensure  => present,
      replace => false,
      content => template('ohmyzsh/zshrc.erb'),
      owner   => $name,
      group   => $name,
    }
  }
}
