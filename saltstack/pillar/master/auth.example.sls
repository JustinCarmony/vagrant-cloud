domain:
    append: cluster.example.com

cluster:
    aws: 3
    rackspace: 3
    digital-ocean: 3

auth:
    digital-ocean:
        client-id:  ...
        api-key:    ...
        location:   New York 2
    aws:
        id:     ...
        key:    ...
    rackspace:
        user:   UserName
        tenant: account #
        apikey: ....

ssh:
    id_rsa: |
        -----BEGIN RSA PRIVATE KEY-----
        ... key here ...
        -----END RSA PRIVATE KEY-----
    id_rsa_pub: ... pub key here ...