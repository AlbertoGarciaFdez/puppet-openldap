class ldap::config {
  file { 'config.ldif':
    path    => $ldap::params::configFile,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("ldap/database.ldif.erb"),
	}

  file { 'replica.ldif':
    path    => $ldap::params::replicationFile,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("ldap/replication.ldif.erb"),
  }

  file { 'ldap.conf':
    path    => '/etc/ldap/ldap.conf',
    owner   => 'openldap',
    group   => 'openldap',
    mode    => '0644',
    content => template("ldap/ldap.conf.erb"),
  }

  file { 'basic_schemas':
    path    => '/etc/ldap/schema',
    ensure  => directory,
    recurse => true,
    purge   => false,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/ldap/schema',
  }

  file { 'accesslog':
    path    => '/var/lib/ldap/accesslog',
    ensure  => directory,
    owner   => 'openldap',
    group   => 'openldap',
    mode    => '0644',
  }

  if str2bool("${ldap::use_backup}") {
    file { 'backup.ldif':
      path    => $ldap::params::backupFile,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'puppet:///modules/ldap/backup.ldif',
    }
  }

  exec { 'cosine_schema':
    command => "${ldap::params::ldapAdd}${ldap::params::schema_dir}/cosine.ldif;echo $?",
    require => File['basic_schemas'],
  }

  exec { 'nis_schema':
    command => "${ldap::params::ldapAdd}${ldap::params::schema_dir}/nis.ldif;echo $?",
    require => File['basic_schemas'],
  }

  exec { 'inetorgperson_schema':
    command => "${ldap::params::ldapAdd}${ldap::params::schema_dir}/inetorgperson.ldif;echo $?",
    require => File['basic_schemas'],
  }

  if str2bool("${ldap::kerberos}") {
    exec { 'kerberos_schema':
      command => "${ldap::params::ldapAdd}${ldap::params::schema_dir}/kerberos.ldif;echo $?",
      require => File['basic_schemas'],
    }
  }

  if str2bool("${ldap::samba}") {
    exec { 'samba_schema':
      command => "${ldap::params::ldapAdd}${ldap::params::schema_dir}/samba.ldif;echo $?",
      require => File['basic_schemas'],
    }
  }

  if str2bool("${ldap::autofs}") {
    exec { 'autofs_schema':
      command => "${ldap::params::ldapAdd}${ldap::params::schema_dir}/autofs.ldif;echo $?",
      require => File['basic_schemas'],
    }
  }
}
