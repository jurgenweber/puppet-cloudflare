define cloudflare::add (
  $domain,
  $destination,
  $type,
  $proxy,
  $ttl,
  ) {

  case $type {
    'a':     { $my_type = 'address' }
    'cname': { $my_type = 'cname' }
    'txt':   { $my_type = 'text' }
    'mx':    { $my_type = 'exchange' }
    default: { fail('Please specify a type') }
  }

  $parts  = split($domain, '/')
  $zone   = $parts[0]
  $record = $parts[1]

  exec { "cloudflare_add_${zone}_${record}":
    command   => "${cloudflare::my_base}/${domain} ${cloudflare::my_base_args} -X PUT -d 'type=${type}&recs=[{\"data\":{\"${my_type}\":\"${destination}\"},\"ttl\":\"${ttl}\",\"proxied\":\"${proxy}\"}]'",
    logoutput => false,
    timeout   => 45,
    unless    => "${cloudflare::my_base}/${zone} ${cloudflare::my_base_args} -X GET | /bin/grep ${record} -c",
  }
}
