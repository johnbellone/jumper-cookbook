require 'spec_helper'

describe_recipe 'jumper::gateway' do
  it { expect(chef_run).to include_recipe('openssh::default') }
  it { expect(chef_run).to include_recipe('openssh::server') }
end
