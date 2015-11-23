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
supports 'redhat', '>= 6.4'
supports 'centos', '>= 6.4'

depends 'os-hardening'
depends 'ssh-hardening'
