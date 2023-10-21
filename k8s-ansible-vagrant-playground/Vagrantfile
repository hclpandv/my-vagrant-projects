# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #-----------------------------------------------------------------------
  #------Creating VM: local ansible control machine to provision k8s nodes
  #-----------------------------------------------------------------------
  config.vm.define "control" do |control|
    control.vm.box = "bento/ubuntu-18.04"
    control.vm.hostname = 'control.vagrant'
    # Assigning IP:
    control.vm.network "private_network", ip: "10.10.10.60"
    control.vm.synced_folder '.', '/vagrant-nfs' , type: 'nfs'
    control.bindfs.bind_folder '/vagrant-nfs', '/vagrant', u: 'vagrant', g: 'www-data', o: 'nonempty', p: '0775'
    #------ Using Virtualbox provider for the exercise
    control.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--name", "control"]
      vb.customize ["modifyvm", :id, "--cpus", 2]
      # Customize the amount of memory on the VM:
      vb.memory = "512"      
    end
    #------ Install ansible
    control.vm.provision "install_ansible", type: "shell" do |instansi|
      instansi.path = "./control/install-ansible.sh"
    end
  end
  #-----------------------------------------------------------
  #------ Creating VM: k8s master node
  #-----------------------------------------------------------
  config.vm.define "master" do |master|
    master.vm.box = "bento/ubuntu-18.04"
    master.vm.hostname = 'master.vagrant'
    # Assigning IP:
    master.vm.network "private_network", ip: "10.10.10.61"
    #------ Using Virtualbox provider for the exercise
    master.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--name", "master"]
      vb.customize ["modifyvm", :id, "--cpus", 2]
      # Customize the amount of memory on the VM:
      vb.memory = "2048"
    end
    #------ Provisioning via shell
    master.vm.provision "shell", inline: <<-SHELL
      apt-get update
    SHELL
  end
  #-----------------------------------------------------------
  #------ Creating VM: k8s worker1 node
  #-----------------------------------------------------------
  config.vm.define "worker1" do |worker1|
    worker1.vm.box = "bento/ubuntu-18.04"
    worker1.vm.hostname = 'worker1.vagrant'
    # Assigning IP:
    worker1.vm.network "private_network", ip: "10.10.10.62"
    #------ Using Virtualbox provider for the exercise
    worker1.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--name", "worker1"]
      vb.customize ["modifyvm", :id, "--cpus", 2]
      # Customize the amount of memory on the VM:
      vb.memory = "2048"
    end
    worker1.vm.provision "shell", inline: <<-SHELL
      apt-get update
    SHELL
  end
  #-----------------------------------------------------------
  #------ Creating VM: k8s worker2 node
  #-----------------------------------------------------------
  config.vm.define "worker2" do |worker2|
    worker2.vm.box = "bento/ubuntu-18.04"
    worker2.vm.hostname = 'worker2.vagrant'
    # Assigning IP:
    worker2.vm.network "private_network", ip: "10.10.10.63"
    #------ Using Virtualbox provider for the exercise
    worker2.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--name", "worker2"]
      vb.customize ["modifyvm", :id, "--cpus", 2]
      # Customize the amount of memory on the VM:
      vb.memory = "2048"
    end
    worker2.vm.provision "shell", inline: <<-SHELL
      apt-get update
    SHELL
  end
end

