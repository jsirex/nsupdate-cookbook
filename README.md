# Description

This simple cookbook provides `nsupdate` LWRP.
Use it as follow:

```ruby
nsupdate 'www.example.com' do
  value 'other.host.com'
  type :cname
  ttl 86400
  action :update
end
```

Available actions:
* create - creates new record if records does not exist
* delete - deletes all records for given name
* update - updates dns records by removing any previous existing and adding new one. Only if new value does not exist yet


# Requirements

## Platform:

* debian
* redhat
* centos

## Cookbooks:

*No dependencies defined*

# Attributes

*No attributes defined*

# Recipes

* nsupdate::default - Manages DNS records using nsupdate

# Resources

* [nsupdate](#nsupdate)

## nsupdate

### Actions

- create:  Default action.
- delete:
- update:

### Attribute Parameters

- value:
- dns_type:
- ttl:  Defaults to <code>86400</code>.

# License and Maintainer

Copyright: Yauhen Artsiukhou

Standard MIT License

Maintainer: Yauhen Artsiukhou <jsirex@gmail.com>
