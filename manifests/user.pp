define ohmyzsh::user (
  $ensure  = present,
  $path    = '/usr/bin/zsh',
  $theme   = 'eastwood',
  $home    = undef,
  $plugins = [
    'git', 'rails', 'rails3', 'rbenv', 'ruby', 'debian', 'rake', 'tmux',
    'bundler'
  ]
) {
  exec { "chsh -s $path $title":
    unless => "grep -E '^${title}.+:${$path}$' /etc/passwd",
    path   => ['/bin'],
  }
  if ( $title != "root" ) {
    if $home == undef { $home = "/home/${title}/.zshrc" }
    file { "$home":
      ensure  => present,
      replace => false,
      content => template('ohmyzsh/zshrc.erb'),
      owner   => $title,
      group   => $title,
    }
  }
}
