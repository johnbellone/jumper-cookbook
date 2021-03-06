name 'jumper'
maintainer 'John Bellone'
maintainer_email 'jbellone@bloomberg.net'
license 'Apache 2.0'
description 'Application cookbook which configures a node to be a bastion host.'
long_description 'Application cookbook which configures a node to be a bastion host.'
version '1.0.0'
issues_url 'https://github.com/johnbellone/jumper-cookbook/issues'
source_url 'https://github.com/johnbellone/jumper-cookbook'

supports 'ubuntu', '>= 12.04'
supports 'redhat', '>= 5.11'
supports 'centos', '>= 5.11'

depends 'chef-client'
depends 'chef-sugar'
depends 'firewall'
depends 'os-hardening'
depends 'ssh-hardening'
depends 'selinux'
depends 'sudo'
depends 'tmux'
