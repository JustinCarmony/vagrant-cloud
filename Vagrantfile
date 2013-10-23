# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Load External Preferences
require File.join(File.dirname(__FILE__), './', 'config/prefs.rb')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Use AWS for all Servers
=begin  
  config.vm.provider :aws do |aws, override|
    aws.access_key_id = $aws_access_key_id
    aws.secret_access_key = $aws_secret_access_key
    aws.keypair_name = $aws_keypair_name
    
    aws.ami = $aws_ami
    aws.region = $aws_region
    aws.instance_type = $aws_instance_type

    override.ssh.username = $aws_ssh_username
    override.ssh.private_key_path = $aws_ssh_private_key_path
  end
=end

  config.vm.hostname = 'master.' + $setting_cluster_domain
  
  config.vm.provider :rackspace do |rs|
    rs.username = $rs_username
    rs.api_key  = $rs_api_key
    rs.flavor   = $rs_flavor
    rs.image    = $rs_image
  end

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.client_id = $do_client_id
    provider.api_key = $do_api_key
  end

  config.vm.define :master , primary: true do |master|
    master.vm.provider "aws" do |aws|
      aws.tags = {
        'Name' => 'salt-master'
      }
    end
    
    master.vm.box = "dummy"
  end

  config.vm.provision :shell, inline: "sudo bash /vagrant/deploy/prep-master.sh " + 'master.' + $setting_cluster_domain
end
