Vagrant setup to test out Aptly. (http://www.aptly.info/)

Comes with some deb files in ./debs/stable and ./debs/testing

Vagrant provision will setup Aptly repos and publish them to aptly.localhost:8080 precise stable-repo and aptly.localhost:8080 precise-testing testing-repo

Nginx is the frontend.  Accessible via aptly.localhost:8080

Add this line to your application's Gemfile:

    vagrant up 
    vagrant ssh

Test out Aptly apt repository commands, eg

http://www.aptly.info/examples/


