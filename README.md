vagrant-cloud
=============

``vagrant-cloud`` is a project that uses ``vagrant``, ``salt``, and ``salt-cloud`` to 
deploy disposable VMs on several providers. 

__This is very experimental & a work in progress, it may not work for everyone.__

## Overview

The goal is for us to be able to use ``vagrant`` to provision one ``salt-master``
in any given provider (AWS, Rackspace, Digital Ocean, etc). Then, through that
``salt-master``, multiple ``salt-minion`` servers can be spun up in any given provider and
connect back to the ``salt-master``.

