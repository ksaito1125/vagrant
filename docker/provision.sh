#! /usr/bin/env bash

PROVISION=/var/vagrant_provision
if [ -f "${PROVISION}" ]
then
	exit 0
fi

# docker setup
update-rc.d docker.io defaults
gpasswd -a vagrant docker

touch ${PROVISION}
