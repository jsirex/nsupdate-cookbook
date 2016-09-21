use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :create do
  ips = Resolv::DNS.new.getaddresses(new_resource.name).map(&:to_s)
  Chef::Log.debug("Resolved hosts: #{ips}")

  ruby_block "Creating DNS Record - #{new_resource.name}" do
    block do
      IO.popen('nsupdate -v', 'r+') do |pipe|
        pipe.puts "update add #{new_resource.name} #{new_resource.ttl} #{new_resource.dns_type} #{new_resource.value}"
        pipe.puts 'show'
        pipe.puts 'send'

        pipe.close_write
        Chef::Log.info pipe.read
      end
    end

    action :create
    only_if { ips.empty? }
  end
end

action :delete do
  ips = Resolv::DNS.new.getaddresses(new_resource.name).map(&:to_s)
  Chef::Log.debug("Resolved hosts: #{ips}")

  ruby_block "Deleting DNS Record - #{new_resource.name}" do
    block do
      IO.popen('nsupdate -v', 'r+') do |pipe|
        pipe.puts "update delete #{new_resource.name}"
        pipe.puts 'show'
        pipe.puts 'send'

        pipe.close_write
        Chef::Log.info pipe.read
      end
    end

    action :create
    not_if { ips.empty? }
  end
end

action :update do
  begin
    new_ip = Resolv.getaddress(new_resource.value)
  rescue Resolv::ResolvError => e
    Chef::Log.warn("Unable to resolve #{new_resource.value}: #{e.message}")
    return
  end

  ips = Resolv::DNS.new.getaddresses(new_resource.name).map(&:to_s)
  Chef::Log.debug("Resolved hosts: #{ips}")

  ruby_block "Updating DNS Record - #{new_resource.name}" do
    block do
      IO.popen('nsupdate -v', 'r+') do |pipe|
        pipe.puts "update delete #{new_resource.name}"
        pipe.puts "update add #{new_resource.name} #{new_resource.ttl} #{new_resource.dns_type} #{new_resource.value}"
        pipe.puts 'show'
        pipe.puts 'send'

        pipe.close_write
        Chef::Log.info pipe.read
      end
    end

    action :create
    not_if { ips.include?(new_ip) }
  end
end
