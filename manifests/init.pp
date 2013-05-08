class ohmyzsh {
  package { 'zsh': }
  include git
  git::repo { 'oh-my-zsh':
    path   => '/usr/src/oh-my-zsh',
    source => 'git://github.com/robbyrussell/oh-my-zsh.git',
    branch => 'master',
    update => 'update',
  }
}
