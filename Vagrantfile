Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 81, host: 8081
  config.vm.network :forwarded_port, guest: 8125, host: 8125, :protocol => 'udp'
  config.vm.network :forwarded_port, guest: 8126, host: 8126, :protocol => 'tcp'
 

  config.omnibus.chef_version = :latest
 
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.roles_path = "roles"
    chef.add_role "monitoring"
  end

end