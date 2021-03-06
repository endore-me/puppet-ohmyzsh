# == Class: ohmyzsh
#
# === Examples
#
# class { 'ohmyzsh': }
#
# or
#
# include ohmyzsh
#
class ohmyzsh {
  package { 'zsh': }
  include git
  file { '/usr/src': ensure => directory }
  git::repo { 'oh-my-zsh':
    path   => '/usr/src/oh-my-zsh',
    source => 'git://github.com/robbyrussell/oh-my-zsh.git',
    branch => 'master',
    update => false,
  }
}
