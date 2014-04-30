puppet-cloudflare
==================

CloudFlare Puppet Module

## Module Installation

* Add the 'cloudflare' folder into your module path
* Include the class and configure the relevant variables for your CloudFlare account:

### EXAMPLE

You need to declare this at the top of your class so the defines can use these details at will:

```ruby
class { 'cloudflare':
  cloudflare_email => "$cloudflare_email",
  cloudflare_tkn   => "$cloudflare_tkn",
}
```

### Add a DNS Record
```ruby
  cloudflare::add { 'asdf.example.com':
    domain           => 'example.com/asdf',
    destination      => 'target.example.com',
    type             => 'cname',
    proxy            => true,
    ttl              => 1,
    require          => Class['cloudflare'],
  }
```

### Edit a DNS Record - not finished
```ruby
  cloudflare::edit { 'asdf.example.com':
  }
```

### Delete a DNS record - not finished
```ruby
  cloudflare::delete { 'asdf.example.com':
  }
```

Riaan Nolan and Jürgen Weber
