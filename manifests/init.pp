class firewall_wrapper (
  $purge = true,
  $ports = {}
){

  resources { 'firewall': purge => true }
  Firewall {
    before  => Class['::rhel::firewall::post'],
    require => Class['::rhel::firewall::pre'],
  }

  firewall { '001 Log traffic':
    ensure     => 'present',
    jump       => 'LOG',
    log_prefix => 'IPTABLES: ',
    log_level  => '6',
  }
  create_resources (rhel::firewall::proto_dport_source,$ports)

}
