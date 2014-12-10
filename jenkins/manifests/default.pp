exec { "apt-get update":
	command => "/usr/bin/apt-get --yes --force-yes update",
}

package { "jenkins":
	require => Exec["apt-get update"],
}
