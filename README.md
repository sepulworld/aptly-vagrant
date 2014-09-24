Vagrant setup to test out Aptly. (http://www.aptly.info/)

Comes with some deb files in ./debs/stable and ./debs/testing

Vagrant provision will setup Aptly repos and publish them to aptly.localhost:8080 precise stable-repo and aptly.localhost:8080 precise-testing testing-repo

Nginx is the frontend.  Accessible via aptly.localhost:8080

```
'vagrant up' will bring up 2 virutal servers.  One is called reposerver and runs your test Aptly repo.  The other is server1 which can install debs from the Aptly repo VM.
    vagrant up 

Vagrant ssh to reposerver
    vagrant ssh reposerver

Vagrant ssh to client server
    vagrant ssh server1
```

```
Use 'reposerver' to test your aptly commands and configurations
Use 'server1' to do your apt-get install
```

Test out Aptly apt repository commands, eg

http://www.aptly.info/examples/


