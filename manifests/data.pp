class ldap::data {
  exec { 'load_config':
    command => "${ldap::params::ldapModify}${ldap::params::configFile}",
  }

  exec { 'replication':
    command	=> "${ldap::params::ldapAdd}${ldap::params::replicationFile}",
    require	=> Exec['load_config'],
    notify	=> Service['slapd'],
  }

  if str2bool("${ldap::use_backup}") { 
    exec { 'load_data':
      command => "${ldap::params::ldapAdd}${ldap::params::backupFile}",
      require => Exec['load_config'],
      notify	=> Service['slapd'],
    }
  }
}
