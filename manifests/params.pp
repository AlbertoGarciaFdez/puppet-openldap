class ldap::params {
  $ldapAdd          = '/usr/bin/ldapadd -QY EXTERNAL -H ldapi:/// -f '
  $ldapModify       = '/usr/bin/ldapmodify -QY EXTERNAL -H ldapi:/// -f '
  $schema_dir       = '/etc/ldap/schema'
  $backupFile       = '/tmp/backup.ldif'
  $configFile       = '/tmp/config.ldif'
  $replicationFile  = '/tmp/replica.ldif'

  #User options
  $samba          = true
  $autofs         = true
  $kerberos       = true
  $organization   = 'example'
  $base_dn        = 'dc=example,dc=org'
  $root_dn        = 'cn=admin,dc=example,dc=org'
  $root_pw        = 'example'#'{SSHA}76GaI0Yvix4ZbhmnvTeF9wgS5IKvec28' # example revisar formato #debconf de la passwd, revisar
  $kerberos_realm = 'EXAMPLE.ORG'
  $ldap_realm     = 'example.org'
  $users_tree     = 'ou=People'
  $ldap_cnRealm   = "cn=${ldap_realm}"
  $use_backup     = false
  $mode           = 'slave'
  $master         = $::hostname,
}
