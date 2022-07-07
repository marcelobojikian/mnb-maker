
Vagrant.configure("2") do |config|

  config.vm.define "personal_machine" do |pm|

    pm.vm.box = "hashicorp/bionic64"
    pm.vm.box_version = "1.0.282"

    pm.vm.network "private_network", ip: "172.17.177.10"

    pm.vm.provider "virtualbox" do |v|
      
      v.name = "Personal Machine ( Ubuntu 18.04 LTS 64 )"
      v.gui = false
      v.memory = 512
      v.cpus = 1

    end

  end
  
end
