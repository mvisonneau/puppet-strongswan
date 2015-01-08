# == Class: strongswan::roadwarrior
#
# Full description of class role here.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'strongswan::roadwarrior': }
#
class strongswan::roadwarrior (
  $conn_name,
  $left = '%any',
  $leftcert,
  $leftfirewall = 'yes',
  $leftid,
  $leftkey,
  $leftkey_type,
  $leftsourceip = '%config',
  $right,
  $rightid,
  $rightsubnet,
) inherits strongswan {
  strongswan::snippet::ipsec_conf { $conn_name:
    ensure  => present,
    content => template("${module_name}/roadwarrior/ipsec.conf.erb"),
  }
  #strongswan::snippet::ipsec_secrets { $conn_name:
  #  ensure  => present,
  #}

  concat::fragment { '$conn_name-key':
    target => $strongswan::ipsec_secrets,
    content => template("${module_name}/roadwarrior/ipsec.secrets.erb"),
  }
}
