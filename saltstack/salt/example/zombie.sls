include:
    - common

ppa:chris-lea/node.js:
    cmd.run:
        - unless: ls /bleh
        - name: add-apt-repository ppa:chris-lea/node.js ; apt-get update

nodejs:
    pkg.installed:
        - names:
            - nodejs 
            - nodejs-dev 
            - npm

