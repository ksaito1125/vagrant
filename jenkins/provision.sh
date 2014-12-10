#! /usr/bin/env bash

PROVISION=/var/vagrant_provision
LOG=/var/log/vagrant_provision.log

if [ -f "${PROVISION}" ]
then
	exit 0
fi
touch ${LOG}

# Add jenkins apt repository
# https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list

touch ${PROVISION}
