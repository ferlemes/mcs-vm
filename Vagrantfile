#
# This file describes how a virtual machine should be created to run 
# some experiments for Fernando Lemes da Silva dissertation.
#
# It required VirtualBox 5.2.18 and Vagrant 2.1.2 or greater.
#

Vagrant.configure('2') do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "mestrado-vm"
  config.disksize.size = '16GB'

  # Forwarded ports
  config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true # http
  config.vm.network :forwarded_port, guest: 8443, host: 8443, auto_correct: true # https

  # Auto install script
  config.vm.provision :shell, path: 'bootstrap.sh'

  # Shared folder
  config.vm.synced_folder '../',   '/home/ubuntu/shared', create: true

  # VM settings
  config.vm.provider :virtualbox do |vb|
    vb.name = 'mestrado-vm'
    vb.customize ['modifyvm', :id, '--memory', '4096']
    vb.customize ['modifyvm', :id, '--cpus', '2']
    vb.customize ['modifyvm', :id, '--ioapic', 'on']
  end
  
end
