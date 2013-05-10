define ohmyzsh::user (
  $ensure  = present,
  $path    = '/usr/bin/zsh',
  $theme   = 'eastwood',
  $name    = $title,
  $home    = undef,
  $plugins = [
    'git', 'rails', 'rails3', 'rbenv', 'ruby', 'debian', 'rake', 'tmux',
    'bundler'
  ]
) {
  exec { "chsh -s $path $name":
    unless => "grep -E '^${name}.+:${$path}$' /etc/passwd",
    path   => ['/bin', '/usr/bin'],
  }
  if ( $name != "root" ) {
    if $home == undef { $home = "/home/${name}/.zshrc" }
    file { "$home":
      ensure  => present,
      replace => false,
      content => template('ohmyzsh/zshrc.erb'),
      owner   => $name,
      group   => $name,
    }
  }
}
