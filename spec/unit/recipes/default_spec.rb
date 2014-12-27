require 'spec_helper'

describe_recipe 'jumper::default' do
  it { expect(chef_run).to include_recipe('chef-vault::default') }
  it { expect(chef_run).to include_recipe('openldap::auth') }
  it { expect(chef_run).to include_recipe('openssh::default') }
  it { expect(chef_run).to include_recipe('openssh::server') }
  it { expect(chef_run).to include_recipe('openssh::lpk') }
  it { expect(chef_run).to include_recipe('openldap::auth') }
  it { expect(chef_run).to include_recipe('python::default') }
  it { expect(chef_run).to include_recipe('python::pip') }
  it { expect(chef_run).to include_recipe('python::virtualenv') }
  it { expect(chef_run).to install_python_pip('python-ldap') }
  it { expect(chef_run).to include_recipe('chef-client::config') }
  it { expect(chef_run).to include_recipe('chef-client::default') }
end
