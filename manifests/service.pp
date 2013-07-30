class ldap::service {
  service { 'slapd':
    ensure => "running",
  }
}
