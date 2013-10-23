include:
    - common

/root/.ssh/id_rsa:
    file.managed:
        - contents_pillar: ssh:id_rsa
        - mode: 400

/root/.ssh/id_rsa.pub:
    file.managed:
        - contents_pillar: ssh:id_rsa_pub
        - mode: 644