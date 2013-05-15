require 'spec_helper'

describe 'ohmyzsh::user', :type => 'define' do
  context "On a Debian OS with no package name specified" do
    context 'non root user' do
      let(:title) { 'someuser' }
      let(:params) { { :home => "/home/#{title}" } }
      it { should contain_exec "chsh -s /usr/bin/zsh #{title}" }
      it { should contain_file "#{params[:home]}/.zshrc" }
    end

    context 'root user' do
      let(:title) { 'root' }
      let(:params) { { :home => "/root" } }
      it { should_not contain_exec "chsh -s /usr/bin/zsh #{title}" }
      it { should_not contain_file "#{params[:home]}/.zshrc" }
    end
  end
end

