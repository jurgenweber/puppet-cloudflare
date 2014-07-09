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
  cloudflare::add { 'sub.domain.com':
    domain           => 'domain.com/sub.domain.com',
    destination      => 'target.domain.com',
    type             => 'cname',
    proxy            => true,
    ttl              => 1,
    require          => Class['cloudflare'],
  }
```

### Edit a DNS Record - placeholder class in progress
```ruby
  cloudflare::edit { 'sub.domain.com':
  }
```

### Delete a DNS record - not finished - use with care
```ruby
  cloudflare::delete { 'sub.domain.com':
    domain           => 'domain.com/sub.domain.com',
    require          => Class['cloudflare'],
  }
```

### Puppet usage example
```ruby
  if $add_dns {
    # Declare Cloudflare credentials
    $cloudflare_email = password_lookup("cloudflare_email", 'global')
    $cloudflare_tkn   = password_lookup("cloudflare_tkn", 'global')

    # Pass Cloudflare credentials
    class { 'cloudflare':
      cloudflare_email => "$cloudflare_email",
      cloudflare_tkn   => "$cloudflare_tkn",
    }

    # Add the sub.doamin.com
    cloudflare::add { 'sub.domain.com':
      domain           => 'domain.com/sub.domain.com',
      destination      => 'target.domain.com',
      type             => 'cname',
      proxy            => true,
      ttl              => 1,
      require          => Class['cloudflare'],
    }
  }
```

Riaan Nolan and Jürgen Weber
