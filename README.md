####Vagrant development environment for Aptly (http://www.aptly.info/)

Comes with some deb files in ./debs/stable and ./debs/testing

Vagrant will provision 2 Ubuntu VMs.  

```
$ vagrant status
Current machine states:

reposerver (Aptly/Jenkins)    running (virtualbox)
server1                       running (virtualbox)
```

####To start:

```
vagrant up
```

reposerver has Aptly configured and 2 repositories published
```
aptly.localhost precise stable-repo
aptly.localhost precise-testing testing-repo
```

#### Build custom Jenkins jobs to interact with Aptly repos
```
http://aptly.localhost:8080
```

server1 is a test VM that you can install packages from the reposerver

Test out Aptly apt repository commands on the reposerver (vagrant ssh; sudo -i)

http://www.aptly.info/examples/ <--- Example commands found here.


####TODO:

~~Setup Jenkins on reposerver for testing build jobs that work with Aptly~~
Configure example Jenkins build jobs that use Aptly for automated packaging, snapshots and repo publishing


