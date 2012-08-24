Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Apache ports are accessible on localhost
  config.vm.forward_port 80, 8080
  config.vm.forward_port 443, 8443

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks-librarian", "cookbooks"]

    chef.data_bags_path = ["data_bags"]

    chef.add_recipe "apt"
    chef.add_recipe "my_website"

    chef.log_level = :debug

    chef.json = {
      'my_website' => {'greeting' => 'Howdy'}
    }
  end
end
