####Vagrant development environment for Aptly (http://www.aptly.info/)

Comes with some deb files in ./debs/stable and ./debs/testing

Vagrant will provision 2 Ubuntu VMs.  

```
$ vagrant status
Current machine states:

reposerver                running (virtualbox)
server1                   running (virtualbox)
```

reposerver has Aptly configured and 2 repositories published
```
aptly.localhost:8080 precise stable-repo
aptly.localhost:8080 precise-testing testing-repo
```

####To start:

```
vagrant up
```

server1 is a test VM that you can install packages from the reposerver

Nginx is the frontend for the repository.  Accessible via aptly.localhost:8080


Test out Aptly apt repository commands on the reposerver, eg

http://www.aptly.info/examples/


####TODO:

Setup Jenkins on reposerver for testing build jobs that work with Aptly

