Puppet Module Openldap
======================

Install and configure ldap with puppet and set the config for replication.

Kerberos and Autofs config can be set.


Usage:
======

Sample usage:

	include ldap


Sample usage:

  	class { 'ldap':  
    	base_dn         => 'dc=example,dc=com',
    	root_dn         => 'cn=admin,dc=example.com',
    	root_pw         => 'example',
    	organization    => 'example',
    	kerberos_realm  => 'EXAMPLE.COM',
    	ldap_realm      => 'cn=example.com',
    	mode            => 'slave',
    	master          => 'ldap1.example.com'
  	}
