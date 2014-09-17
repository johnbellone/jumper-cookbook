require 'spec_helper'

describe_recipe 'jumper::default' do
  it { expect(chef_run).to include_recipe('chef-sugar::default') }
  it { expect(chef_run).to include_recipe('chef-vault::default') }
  it { expect(chef_run).to include_recipe('openldap::auth') }
  it { expect(chef_run).to include_recipe('openssh::lpk') }
end
