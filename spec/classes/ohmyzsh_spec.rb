require 'spec_helper'

describe 'ohmyzsh', :type => 'class' do
  context "On a Debian OS with no package name specified" do
    let :facts do
      { :osfamily => 'Debian' }
    end
    it { should contain_package 'zsh' }
    it { should include_class 'git' }
    it { should contain_git__repo 'oh-my-zsh' }
  end
end
