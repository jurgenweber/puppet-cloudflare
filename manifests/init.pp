class cloudflare (
  $cloudflare_email,
  $cloudflare_tkn,
  $cloudflare_api = 'https://api.cloudflare.com/v3/dns',
) {
  $my_tkn         = " -H 'X-Auth-Key: ${cloudflare_tkn}'"
  $my_email       = " -H 'X-Auth-Email: ${cloudflare_email}'"
  $my_content     = " -H 'content-type: application/x-www-form-urlencoded'"
  $my_base        = "/usr/bin/curl ${cloudflare_api}"
  $my_base_args   = "${my_tkn} ${my_email} ${my_content}"

  if ! defined(Package['curl']) {
    ensure_resource('package', 'curl', {
      ensure => present,
    })
  }
}
