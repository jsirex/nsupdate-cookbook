require 'resolv'

actions :create, :delete, :update
default_action :create if defined?(default_action)

attribute :value, :kind_of => String
attribute :dns_type, :equal_to => [:cname, :a, :txt, :ptr]
attribute :ttl, :kind_of => Integer, :default => 86400
