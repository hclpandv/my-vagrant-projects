# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #-----------------------------------------------------------
  #------ Creating VM: mysql-master db1
  #-----------------------------------------------------------
  config.vm.define "db1" do |db1|
    db1.vm.box = "bento/ubuntu-18.04"
    db1.vm.hostname = 'db1'
    db1.vm.synced_folder '.', '/vagrant-nfs' , type: 'nfs'
    db1.bindfs.bind_folder '/vagrant-nfs', '/vagrant', u: 'vagrant', g: 'www-data', o: 'nonempty', p: '0775'
    # Assigning IP:
    db1.vm.network "private_network", ip: "10.10.10.51"
    #------ Using Virtualbox provider for the exercise
    db1.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--name", "db1"]
      # Customize the amount of memory on the VM:
      vb.memory = "512"
    end
    # Install ansible
    db1.vm.provision "install_ansible", type: "shell" do |instansi|
      instansi.path = "./install-ansible.sh"
    end
    # Install ansible roles
    db1.vm.provision "roles", type: "shell" do |roles|
      roles.inline = "ansible-galaxy install -p /vagrant geerlingguy.mysql"
      roles.inline = "ansible-galaxy install -p /vagrant geerlingguy.ntp"
    end
    #------ Provisioning through Ansible
    db1.vm.provision "ansible_local" do |ansible|
      ansible.install = true
      ansible.playbook = "deploy-master.yml"
      ansible.verbose = 'v'
    end
  end
  #-----------------------------------------------------------
  #------ Creating VM: a mysql-slave db2
  #-----------------------------------------------------------
  config.vm.define "db2" do |db2|
    db2.vm.box = "bento/ubuntu-18.04"
    db2.vm.hostname = 'db2'
    db2.vm.synced_folder '.', '/vagrant-nfs' , type: 'nfs'
    db2.bindfs.bind_folder '/vagrant-nfs', '/vagrant', u: 'vagrant', g: 'www-data', o: 'nonempty', p: '0775'
    # Assigning IP:
    db2.vm.network "private_network", ip: "10.10.10.52"
    #------ Using Virtualbox provider for the exercise
    db2.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--name", "db2"]
      # Customize the amount of memory on the VM:
      vb.memory = "512"
    end
    # Install ansible
    db2.vm.provision "install_ansible", type: "shell" do |instansi|
      instansi.path = "./install-ansible.sh"
    end
    # Install ansible roles
    db2.vm.provision "roles", type: "shell" do |roles|
      roles.inline = "ansible-galaxy install -p /vagrant geerlingguy.mysql"
    end
    #------ Provisioning through Ansible
    db2.vm.provision "ansible_local" do |ansible|
      ansible.install = true
      ansible.playbook = "deploy-slave.yml"
      ansible.verbose = 'v'
    end
  end  
end

