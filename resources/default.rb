# frozen_string_literal: true

require 'resolv'

actions :create, :delete, :update
default_action :create

attribute :value, :kind_of => String
attribute :dns_type, :equal_to => [:cname, :a, :txt, :ptr]
attribute :ttl, :kind_of => Integer, :default => 86400
