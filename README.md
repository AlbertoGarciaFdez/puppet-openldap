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


Full Usage:
===========

This class shows how to create a complete setup for ldap master and slaves, with this class and others on my github.

	class ldap-master {

  		class { 'ldap':
    		organization    => 'example',
    		base_dn         => 'dc=example,dc=org',
    		root_dn         => 'cn=admin,dc=example,dc=org',
    		root_pw         => 'example',
    		kerberos_realm  => 'EXAMPLE.ORG',
    		ldap_realm      => 'example.org',
    		users_tree      => 'ou=People',
    		mode            => 'master',
  		}

  		class { 'nginx':}

  		nginx::vhost { 'ldapMaster.example.org':
    		docroot         => '/usr/share/phpldapadmin/htdocs',
    		create_docroot  => 'false',
    		template        =>  'nginx/vhost/vhost_fpm.erb',
  		}

  		class { 'phpldapadmin':
    		base_dn => 'dc=example,dc=org',
    		root_dn => 'cn=admin,dc=example,dc=org',
  		}
	}
