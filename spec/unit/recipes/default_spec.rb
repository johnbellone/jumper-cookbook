require 'spec_helper'

describe_recipe 'jumper::default' do
  it { expect(chef_run).to include_recipe('chef-provisioning::default') }
  it { expect(chef_run).to include_recipe('chef-vault::default') }
  it { expect(chef_run).to include_recipe('openldap::auth') }
  it { expect(chef_run).to include_recipe('openssh::default') }
  it { expect(chef_run).to include_recipe('openssh::iptables') }
  it { expect(chef_run).to include_recipe('openssh::lpk') }
  it { expect(chef_run).to include_recipe('openldap::auth') }
  it { expect(chef_run).to include_recipe('python::default') }
  it { expect(chef_run).to include_recipe('python::pip') }
  it { expect(chef_run).to include_recipe('python::virtualenv') }
  it { expect(chef_run).to install_python_pip('python-ldap') }
  it { expect(chef_run).to include_recipe('chef-client::config') }
  it { expect(chef_run).to include_recipe('chef-client::default') }

  it do
    expect(chef_run).to create_directory(File.join(chef_run.node['jumper']['home_path'], 'vagrant', '.ssh'))
      .with(recursive: true)
      .with(owner: 'root')
      .with(group: 'root')
      .with(mode: '0600')
  end

  it do
    path = File.join(chef_run.node['jumper']['home_path'], 'vagrant', '.ssh')
    expect(chef_run).to create_private_key(File.join(path, 'id_rsa'))
      .with(public_key_path: File.join(path, 'id_rsa.pub'))
  end
end
