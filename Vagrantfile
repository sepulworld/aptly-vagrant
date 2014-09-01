# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 4
  end
# Puppet
  config.vm.synced_folder "puppet/modules", "/tmp/vagrant-puppet/puppet/modules"
  config.vm.provision "shell", path: "make_vagrant_data.sh" 
  config.vm.provision "shell", path: "generate_gpg.sh"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.options = ["--modulepath", "/tmp/vagrant-puppet/puppet/modules"]
    puppet.manifest_file  = "site.pp"
  end
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provision "shell", path: "publish_repos.sh"
end
