# frozen_string_literal: true

require 'spec_helper'

describe 'nsupdate::default' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'debian', version: '9.2').converge(described_recipe)
  end

  it 'runs' do
    expect(chef_run)
  end
end
