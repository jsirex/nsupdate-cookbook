# frozen_string_literal: true

name             'nsupdate'
maintainer       'Yauhen Artsiukhou'
maintainer_email 'jsirex@gmail.com'
license          'MIT'
description      'Manages DNS records using nsupdate'
long_description 'Manages DNS records using nsupdate'
version          '0.1.2'

issues_url       'https://github.com/jsirex/nsupdate-cookbook/issues/'
source_url       'https://github.com/jsirex/nsupdate-cookbook'

supports 'debian'
supports 'redhat'
supports 'centos'

# depends 'cookbook', '>= 0.0.0'

chef_version '>= 12'

# Provided recipes
recipe 'nsupdate::default', 'Manages DNS records using nsupdate'

# Automatically installed gems before chef run (new in 12.8)
# gem 'whatever'
