require 'spec_helper'

describe 'dropbox::default' do
  let(:chef_run) do
    runner = ChefSpec::Runner.new(:platform => 'ubuntu', :version => '14.04')
    runner.converge(described_recipe)
  end

  it 'installs the dropbox repo' do
    expect(chef_run).to add_apt_repository('dropbox').with(uri: 'http://linux.dropbox.com/ubuntu', distribution: 'trusty')
  end

  it 'installs the dropbox package' do
    expect(chef_run).to install_package('dropbox')
  end

  it 'installs the python-gpgme package' do
    expect(chef_run).to install_package('python-gpgme')
  end
end
