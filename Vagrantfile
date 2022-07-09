
Vagrant.configure("2") do |config|

  config.vm.box_check_update = false
  config.vm.boot_timeout = 600

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

  config.vm.define "vault_server" do |vault|
    vault.vm.box = "hashicorp/bionic64"
    vault.vm.box_version = "1.0.282"

    vault.vm.network "private_network", ip: "172.17.177.20"

    vault.vm.provision "shell",
      inline: "cat .ssh/authorized_keys | grep -f /vagrant/.ssh/key_vault_server.pub > /dev/null && echo 'Key OK' || cat /vagrant/.ssh/key_vault_server.pub >> .ssh/authorized_keys"

    vault.vm.provision "shell",
      inline: "sudo mkdir -p /root/.ssh && cat /vagrant/.ssh/key_vault_server.pub > /root/.ssh/authorized_keys"

      vault.vm.provision :ansible do |ansible|
        ansible.playbook = "ansible/main.yml"
        ansible.host_vars = {
          "vault_server" => {
            "ansible_python_interpreter" => "/usr/bin/python3",
            "ansible_ssh_common_args" => "'-o StrictHostKeyChecking=no'"
          }
        }
      end

    vault.vm.provider "virtualbox" do |v|

      v.name = "Vault Server ( Ubuntu 18.04 LTS 64 )"
      v.memory = "512"
      v.cpus = "1" 
      v.customize ["modifyvm", :id, "--groups", "/iac"]

    end

  end
  
end
