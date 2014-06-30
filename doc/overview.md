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

