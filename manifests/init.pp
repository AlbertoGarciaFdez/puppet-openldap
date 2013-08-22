class ldap (
  $samba          = params_lookup( 'samba' ),
  $autofs         = params_lookup( 'autofs' ),
  $kerberos       = params_lookup( 'kerberos' ),
  $base_dn        = params_lookup( 'base_dn' ),
  $root_dn        = params_lookup( 'root_dn' ),
  $root_pw        = params_lookup( 'root_pw' ),
  $organization   = params_lookup( 'organization' ),
  $kerberos_realm = params_lookup( 'kerberos_realm' ),
  $ldap_realm     = params_lookup( 'ldap_realm' ),
  $users_tree     = params_lookup( 'users_tree' ),
  $ldap_cnRealm   = params_lookup( 'ldap_cnRealm' ),
  $use_backup     = params_lookup( 'use_backup' ),
  $mode           = params_lookup( 'mode' ),
  $master         = params_lookup( 'master' )

) inherits ldap::params {

  include ldap::install
  include ldap::config
  include ldap::data
  include ldap::service
  
  Class['ldap::install'] -> Class['ldap::config'] -> Class['ldap::data'] -> Class['ldap::service']
}
