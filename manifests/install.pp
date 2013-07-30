class ldap::install {
  file { 'preseedSlapd':
    path	  => '/tmp/preseedSlapd',
    owner   => 'root',
    group	  => 'root',
    mode	  => '0640',
    content	=> template("ldap/slapdSelections.erb"),
  }

  package { 'slapd': 
    ensure 			  => installed,
    responsefile	=> '/tmp/preseedSlapd',
    require			  => File['preseedSlapd'],
  }

  package { 'ldap-utils':
    ensure	=> installed,
  }
}
