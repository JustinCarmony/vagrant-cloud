#!/bin/bash

MASTER_IP=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
grep -i $1 /etc/hosts \
    || echo -e "\n$MASTER_IP\t$1\n127.0.1.1\t$1\n" >> /etc/hosts 
        

echo $1 > /etc/hostname

# Install just a few dependancies 
aptitude install -y git-core 

# Install Salt with Master
ls /var/installed_salt.txt || wget -O - http://bootstrap.saltstack.org | sudo sh -s -- -M git develop
touch /var/installed_salt.txt

diff --brief <(sort /vagrant/saltstack/etc/master) <(sort /etc/salt/master) >/dev/null 
comp_value=$?

if [ $comp_value -eq 1 ]
then
    echo "master config IS DIFFERENT"
    cp /vagrant/saltstack/etc/master /etc/salt/master
    service salt-master restart
else
    echo "master config the same"
fi

diff --brief <(sort /vagrant/saltstack/etc/minion) <(sort /etc/salt/minion) >/dev/null 
comp_value=$?

if [ $comp_value -eq 1 ]
then
    echo "minion config IS DIFFERENT"
    cp /vagrant/saltstack/etc/minion /etc/salt/minion
    service salt-minion restart
else
    echo "minion config the same"
fi

# Accept any new salt minions
salt-key --yes -a $1

salt-call state.highstate