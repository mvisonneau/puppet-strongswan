# Configure a strongSwan connection configuration.
define strongswan::conn(
  String $conn_name = $title,
  Hash $options     = {},
) {
  # The base class must be included first because it is used by parameter
  # defaults.
  if ! defined( Class['strongswan'] ) {
    fail( 'You must include the strongswan base class before using any strongswan defined resources' )
  }

  concat::fragment { "ipsec_conf_conn-${conn_name}":
    ensure  => present,
    content => template( 'strongswan/ipsec_conf_conn.erb' ),
    target  => $strongswan::params::ipsec_conf,
    order   => '03',
  }
}
