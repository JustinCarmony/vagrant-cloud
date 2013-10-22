#!/bin/bash

MASTER_IP=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
grep -i "master.cluster.salt.net" /etc/hosts \
    || echo -e "\n$MASTER_IP\tmaster.cluster.salt.net\n127.0.1.1\tmaster.cluster.salt.net\n" >> /etc/hosts 
        

echo "master.cluster.salt.net" > /etc/hostname

# Some Dependencies to install Pip
apt-get install --yes \
    python-pip \
    python-dev \
    python-setuptools \
    build-essential \
    swig \
    python-m2crypto \
    htop \
    git-core


pip install pyzmq PyYAML pycrypto msgpack-python jinja2 psutil salt

# Install apache-libcloud
pip install apache-libcloud

# Install Salt with Master
ls /var/installed_salt.txt || wget -O - http://bootstrap.saltstack.org | sudo sh -s -- -M git develop
touch /var/installed_salt.txt

which salt-cloud || pip install git+https://github.com/saltstack/salt-cloud.git#egg=salt_cloud

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
salt-key -A --yes

# Copy Over Any Cloud Configs
cp -rf /vagrant/saltstack/etc/cloud* /etc/salt