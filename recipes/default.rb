# frozen_string_literal: true

case node['platform_family']
when 'debian'
  package 'dnsutils' do
    action :install
  end
when 'rhel'
  package 'bind-utils' do
    action :install
  end
end
