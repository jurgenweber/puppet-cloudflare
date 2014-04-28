define cloudflare::delete (
 $domain,
 ) {
  $parts  = split($domain, '/')
  $zone   = $parts[0]
  $record = $parts[1]

  exec { "cloudflare_delete_${domain}":
    command   => "${cloudflare::my_base}/${domain} ${cloudflare::my_base_args} -X DELETE -d 'type=ALL'",
    logoutput => true,
    timeout   => 45,
    onlyif    => "${cloudflare::my_base}/${zone} ${cloudflare::my_base_args} -X GET | /bin/grep ${record} -c",
  }
}
