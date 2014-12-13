exec { "apt-get update":
	command => "/usr/bin/apt-get --yes --force-yes update",
}

package { "docker.io":
	require => Exec["apt-get update"],
}
