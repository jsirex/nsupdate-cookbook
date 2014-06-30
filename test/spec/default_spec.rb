require 'chefspec'
require 'chefspec/berkshelf'

describe 'nsupdate::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge 'nsupdate' }

  it 'installs dnsutils' do
    expect(chef_run).to install_package('dnsutils')
  end
end
