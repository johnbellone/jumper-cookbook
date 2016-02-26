require 'chefspec'
require 'chefspec/cacher'
require 'chefspec/policyfile'
require 'chef/sugar'

describe 'jumper::default' do
  context 'with default node attributes' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge('jumper::default')
    end
    it { expect(chef_run).to include_recipe 'selinux::default' }
    it { expect(chef_run).to include_recipe 'chef-sugar::default' }
    it { expect(chef_run).to include_recipe 'sudo::default' }
    it { expect(chef_run).to include_recipe 'ssh-hardening::default' }
    it { expect(chef_run).to include_recipe 'os-hardening::default' }
    it { expect(chef_run).to include_recipe 'tmux::default' }
    it { expect(chef_run).to include_recipe 'firewall::default' }
    it { expect(chef_run).to include_recipe 'chef-client::cron' }
    it { expect(chef_run).to include_recipe 'chef-client::config' }
  end

  context "with node['firewall']['allow_mosh'] = true" do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
        node.set['firewall']['allow_mosh'] = true
      end.converge('jumper::default')
    end
    it { expect(chef_run).to include_recipe 'selinux::default' }
    it { expect(chef_run).to include_recipe 'chef-sugar::default' }
    it { expect(chef_run).to include_recipe 'sudo::default' }
    it { expect(chef_run).to include_recipe 'ssh-hardening::default' }
    it { expect(chef_run).to include_recipe 'os-hardening::default' }
    it { expect(chef_run).to include_recipe 'tmux::default' }
    it { expect(chef_run).to include_recipe 'firewall::default' }
    it { expect(chef_run).to include_recipe 'chef-client::cron' }
    it { expect(chef_run).to include_recipe 'chef-client::config' }
  end
end
