# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048 
    v.cpus = 2
  end

# Setup Aptly Repo VM 
  config.vm.define "reposerver" do |buildRepoServer|
    buildRepoServer.vm.hostname = "reposerver"
    buildRepoServer.vm.network "private_network", ip: "192.168.100.110"
    buildRepoServer.vm.synced_folder "puppet/environments/vagrant/modules", "/tmp/vagrant-puppet/puppet/modules"
    buildRepoServer.vm.provision "shell", path: "make_vagrant_data.sh"
    buildRepoServer.vm.provision "shell", path: "install_build_tools.sh"
    buildRepoServer.vm.provision "shell", path: "generate_gpg.sh"
    buildRepoServer.vm.provision :puppet do |puppet|
      puppet.environment = "vagrant"
      puppet.environment_path = "puppet/environments"
      puppet.manifest_file = "site.pp"
      puppet.manifests_path = "puppet/environments/vagrant/manifests"
    end
    buildRepoServer.vm.network "forwarded_port", guest: 80, host: 8081
    buildRepoServer.vm.network "forwarded_port", guest: 8080, host: 8080
    buildRepoServer.vm.network "forwarded_port", guest: 8082, host: 8082
    buildRepoServer.vm.provision "shell", path: "publish_repos.sh"
  end

# Setup server1 which will have Aptly repos in sources.list.d
  config.vm.define "server1" do |buildServer1|
    buildServer1.vm.hostname = "server1"
    buildServer1.vm.network "private_network", ip: "192.168.100.111"
    buildServer1.vm.synced_folder "puppet/environments/vagrant/modules", "/tmp/vagrant-puppet/puppet/modules"
    buildServer1.vm.provision :puppet do |puppet|
      puppet.environment = "vagrant"
      puppet.environment_path = "puppet/environments"
      puppet.manifest_file = "site_server.pp"
      puppet.manifests_path = "puppet/environments/vagrant/manifests"
    end
    buildServer1.vm.provision "shell", inline: "gpg --import /vagrant/vagrant.asc" 
    buildServer1.vm.provision "shell", path: "add_aptly_repo.sh"
  end
end
