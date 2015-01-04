source 'https://supermarket.chef.io'
cookbook 'openssh', git: 'https://github.com/johnbellone/openssh-cookbook'
metadata

group :test, :integration do
  cookbook 'jumper-ldap', path: 'spec/fixtures/cookbooks/jumper-ldap'
end
