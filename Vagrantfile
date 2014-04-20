# -*- mode: ruby -*-
# vi: set ft=ruby :

# This is intended to be a drop-in Vagrantfile, which reads VM configurations
# from a yaml file (vagrant.yml) in the root directory.
# It supports vagrant cloud boxes and traditional boxes
# See the README for more thorough documentation.

# We're going to read from yaml files, so we gots to know how to yaml
require 'yaml'

# Print an error message and stop execution on handled errors
def handle_error(error_msg)
  puts "ERROR: #{error_msg}"
  exit
end

# Check the "nodes" element from vagrant.yml for existence and completeness
def verify_nodes(nodes)
  # Make sure that at least one node is defined
  if !nodes || nodes.empty?
    error_msg = "No nodes defined in vagrant.yml"
    handle_error(error_msg)
  end

  # TODO: Add per-node checks for completeness
  #       Build up one big error message with all failed checks
end

# Verify that vagrant.yml exists
root_dir = File.dirname(__FILE__)
vagrant_yaml_file = "#{root_dir}/vagrant.yml"
error_msg = "#{vagrant_yaml_file} does not exist"
handle_error(error_msg) unless File.exists?(vagrant_yaml_file)

# Read box and node configs from vagrant.yml
vagrant_yaml = YAML.load_file(vagrant_yaml_file)
error_msg = "#{vagrant_yaml_file} exists, but is empty"
handle_error(error_msg) unless vagrant_yaml

boxes = vagrant_yaml['boxes']
nodes = vagrant_yaml['nodes']

# Verify that node definitions exist and are well-formed
verify_nodes(nodes)

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Define vagrant VMs for each node defined in vagrant.yml
  nodes.each do |node_name, node_details|
    config.vm.define node_name do |node|
      # configure box name and url (if not a vagrant cloud box)
      box_name = "#{node_details['box']}"
      node.vm.box = "#{box_name}"
      boxes.key?("#{box_name}") && node.vm.box_url = boxes[box_name]
     
      # configure hostname
      node.vm.hostname = node_details['hostname']

      # configure networks
      networks = node_details['networks']
      networks && networks.each do |network|
        case network['name']
        when :private_network
          # If an IP is specified, use it, otherwise use DHCP
          if network['ip']
            node.vm.network network['name'], ip: network['ip']
          else
            node.vm.network network['name'], type: :dhcp
          end
        when :public_network
          # If an IP is specified, use it, otherwise use DHCP
          if network['ip'] 
            node.vm.network network['name'], ip: network['ip'], bridge: network['bridge']
          else
            node.vm.network network['name'], bridge: network['bridge']
          end
        end
      end

      # configure synced folders 
      synced_folders = node_details['synced_folders']
      synced_folders && synced_folders.each do |synced_folder|
        node.vm.synced_folder synced_folder['host'], synced_folder['guest']
      end

      # configure forwarded ports
      forwarded_ports = node_details['forwarded_ports']
      forwarded_ports && forwarded_ports.each do |forwarded_port|
        node.vm.network "forwarded_port", guest: forwarded_port['guest'], host: forwarded_port['host']
      end

      # configure memory and cpus
      # TODO: extend to work with VMWare Fusion provider
      node.vm.provider :virtualbox do |vb|
        vb.name = node_name
        vb.customize [ "modifyvm", :id, "--memory", node_details['memory'] ]
        vb.customize [ "modifyvm", :id, "--cpus", node_details['cpus'] ]
      end
    end
  end
end