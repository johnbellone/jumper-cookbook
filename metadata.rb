name             'jumper'
maintainer       'John Bellone'
maintainer_email 'jbellone@bloomberg.net'
license          'Apache 2.0'
description      'Installs/Configures jumper'
long_description 'Installs/Configures jumper'
version          '0.1.0'

%w(centos redhat).each do |name|
  supports name, '~> 7.0'
  supports name, '~> 6.4'
end

supports 'ubuntu', '= 14.04'
supports 'ubuntu', '= 12.04'

depends 'chef-client'
depends 'chef-sugar'
depends 'chef-provisioning'
depends 'chef-vault'
depends 'openldap'
depends 'openssh'
depends 'python'
