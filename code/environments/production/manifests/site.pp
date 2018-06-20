## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
# If we create files on our nodes we don't create backups of them in the local bucket
File { backup => false }
notify { 'Agent connection is successful': }
notify { 'Hello': }
user { 'ben':
  ensure => present,
  uid => '507',
  gid => '507',
  shell => '/bin/bash',
  home => '/home/ben',
  managehome => true,
}

group { 'ben':
    ensure => 'present',
      gid  => '507',
}
#node 'nodeubuntu16-229.rhcrco.int' { 
node default {
  include puppet_vim
}
node 'node203centos7' {
  include role::lamp
}

node 'puppet' {
  include role::master
}
 #node /rhcrco\.int$/ { 
  #  notify { 'FQDN nodes only':, }
  #  }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

#node default {
#  notify { hiera(motd::message): }
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
#}
