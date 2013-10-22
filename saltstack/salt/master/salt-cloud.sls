include:
    - common

salt-cloud-pip-deps:
    pip.installed:
        - names:
            - pyzmq 
            - PyYAML 
            - pycrypto 
            - msgpack-python 
            - jinja2 
            - psutil

apache-libcloud:
    pip.installed:
        - require:
            - pip: salt-cloud-pip-deps

salt-cloud:
    cmd.run:
        - name: pip install git+https://github.com/saltstack/salt-cloud.git#egg=salt_cloud
        - unless: which salt-cloud

/etc/salt/cloud:
    file.managed:
        - source: salt://master/files/etc/cloud
        - template: jinja

/etc/salt/cloud.profiles:
    file.managed:
        - source: salt://master/files/etc/cloud.profiles
        - template: jinja

/etc/salt/cloud.providers:
    file.managed:
        - source: salt://master/files/etc/cloud.providers
        - template: jinja