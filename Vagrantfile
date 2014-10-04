# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.provider "virtualbox"

# Setup Aptly Repo VM 
  config.vm.define "reposerver" do |buildRepoServer|
    buildRepoServer.vm.network "private_network", ip: "192.168.100.110"
    buildRepoServer.vm.synced_folder "puppet/modules", "/tmp/vagrant-puppet/puppet/modules"
    buildRepoServer.vm.provision "shell", path: "make_vagrant_data.sh" 
    buildRepoServer.vm.provision "shell", path: "generate_gpg.sh"
    buildRepoServer.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.options = ["--modulepath", "/tmp/vagrant-puppet/puppet/modules"]
      puppet.manifest_file  = "site.pp"
    end
    buildRepoServer.vm.network "forwarded_port", guest: 80, host: 8081
    buildRepoServer.vm.network "forwarded_port", guest: 8080, host: 8080
    buildRepoServer.vm.provision "shell", path: "publish_repos.sh"
  end

# Setup server1 which will have Aptly repos in sources.list.d
  config.vm.define "server1" do |buildServer1|
    buildServer1.vm.network "private_network", ip: "192.168.100.111"
    buildServer1.vm.provision :puppet do |puppet2|
      puppet2.manifests_path = "puppet/manifests_server"
      puppet2.module_path = "puppet/modules"
      puppet2.options = ["--modulepath", "/tmp/vagrant/puppet/modules"]
      puppet2.manifest_file  = "site.pp"
    end
    buildServer1.vm.provision "shell", inline: "gpg --import /vagrant/vagrant.asc" 
    buildServer1.vm.provision "shell", path: "add_aptly_repo.sh"
  end
end
