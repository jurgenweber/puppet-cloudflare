class cloudflare (
  $email,
  $tkn,
  $cloudflare_api = 'https://api.cloudflare.com/v3/dns',
) {
  $my_tkn         = " -H 'X-Auth-Key: ${tkn}'"
  $my_email       = " -H 'X-Auth-Email: ${email}'"
  $my_content     = " -H 'content-type: application/x-www-form-urlencoded'"
  $my_base        = "/usr/bin/curl ${cloudflare_api}"
  $my_base_args   = "${my_tkn} ${my_email} ${my_content}"

  ensure_resource('package', 'curl', {
    ensure => present,
  })
}
