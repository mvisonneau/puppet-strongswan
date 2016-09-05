# strongSwan setup configuration.
class strongswan::setup(
  Hash $options = {},
) inherits strongswan::params {

  concat::fragment { 'ipsec_conf_setup':
    ensure  => present,
    content => template('strongswan/ipsec_conf_setup.erb'),
    target  => $strongswan::params::ipsec_conf,
    order   => '02',
  }
}
