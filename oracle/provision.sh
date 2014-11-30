#! /usr/bin/env bash

PROVISION=/var/vagrant_provision
LOG=/var/log/vagrant_provision.log

if [ -f "${PROVISION}" ]
then
	exit 0
fi
touch ${LOG}

# create swap file.
for i in 1 2
do
	SWAPFILE=/home/swapfile$i
	dd if=/dev/zero of=${SWAPFILE} bs=1024 count=1048576 >> ${LOG}
	mkswap ${SWAPFILE}
	chmod 0600 ${SWAPFILE}
	swapon ${SWAPFILE}
	bash -c "echo '${SWAPFILE} swap swap defaults 0 0' >> /etc/fstab"
done

# Debian Repository
cp /vagrant_data/priv.list /etc/apt/sources.list.d
apt-get --yes --force-yes update > /dev/null
apt-get install --yes --force-yes oracle-xe >> ${LOG}
cp -p /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh /etc/profile.d
/etc/init.d/oracle-xe configure responseFile=/vagrant_data/oracle11g-xe/response/xe.rsp >> ${LOG}
source /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
sqlplus system/pssword@XE @?/rdbms/admin/utlsampl.sql

touch ${PROVISION}
