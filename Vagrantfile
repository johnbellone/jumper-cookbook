Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  config.vm.box = ENV.fetch('VAGRANT_BOX', 'opscode-ubuntu-12.04')

  config.vm.define :ldap do |guest|
    guest.vm.network :private_network, ip: '172.16.44.2'
    guest.vm.provision :chef_solo do |chef|
      chef.run_list = ['recipe[openldap::master]']
      chef.json = {
        openldap: {
          server: 'localhost',
          rootpw: '{SSHA}6BjlvtSbVCL88li8IorkqMSofkLio58',
          tls_enabled: false
        }
      }
    end
  end

  config.vm.define :jumpbox, primary: true do |guest|
    guest.vm.network :private_network, ip: '172.16.44.3'
    guest.vm.provision :chef_solo do |chef|
      chef.run_list = %w(recipe[jumper])
      chef.json = {
        openldap: {
          server: '172.16.44.2',
          tls_enabled: false
        }
      }
    end
  end
end
