Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  config.cache.scope = :box

  config.vm.box = ENV.fetch('VAGRANT_BOX', 'opscode-ubuntu-12.04')

  config.vm.define :ldap do |guest|
    guest.vm.network :private_network, ip: '172.16.44.2'
    guest.vm.provision :chef_solo do |chef|
      chef.data_bags_path = File.join(File.expand_path('..', __FILE__), 'spec/fixtures/data_bags')
      chef.run_list = %w(ubuntu jumper-ldap)
      chef.json = {
        dev_mode: true
      }
    end
  end

  config.vm.define :jumpbox, primary: true do |guest|
    guest.vm.network :private_network, ip: '172.16.44.3'
    guest.vm.provision :chef_solo do |chef|
      chef.data_bags_path = File.join(File.expand_path('..', __FILE__), 'spec/fixtures/data_bags')
      chef.run_list = %w(jumper)
      chef.json = {
        dev_mode: true,
        openldap: {
          server: '172.16.44.2',
          tls_enabled: false
        }
      }
    end
  end
end
