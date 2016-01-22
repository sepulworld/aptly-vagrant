####Vagrant development environment for Aptly (http://www.aptly.info/)

Requires r10k

```
gem install r10k
cd aptly-vagrant/puppet/environments/vagrant
r10k puppetfile install
```

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

#### Add new Jenkins build jobs:

Add job here:  puppet/modules/jenkins_jobs/manifests/  (See Example in directory, voltdb-php-client.pp)
Add job xml configuration here: puppet/modules/jenkins_jobs/templates/<job_name>.xml.erb

Then run
```
vagrant provision reposerver
```

server1 is a test VM that you can install packages from the reposerver

Test out Aptly apt repository commands on the reposerver (vagrant ssh; sudo -i)

http://www.aptly.info/examples/ <--- Example commands found here.

#### Aptly API interactions

Aptly API running on reposerver port 8082

```
curl http://aptly.localhost:8082/api/repos/stable-repo
curl http://aptly.localhost:8082/api/repos
```
More API commands found in beta docs: http://beta.aptly.info/doc/api/

