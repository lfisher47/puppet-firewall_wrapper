class firewall_wrapper (
  $purge = true,
  $ports = {}
){

  resources { 'firewall': purge => true }
  Firewall {
    before  => Class['::rhel::firewall::post'],
    require => Class['::rhel::firewall::pre'],
  }

  create_resources (rhel::firewall::proto_dport_source,$ports)

}
