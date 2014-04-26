data-driven-vagrantfile
=======================

This project defines a Vagrantfile that reads all VM configuration from a file, vagrant.yml, that resides in the same directory as the Vagrantfile. You should be able to use the Vagrantfile without modification for most commonly used vagrant settings, defining your project setttings in vagrant.yml. You can find detailed documentation of the vagrant settings at the [vagrant](http://www.vagrantup.com/) project's [documentation](http://docs.vagrantup.com/v2/) page. This README will focus on configuring vagrant.yml for supported settings.

There are a number of sample vagrant.yml files in the [examples/vagrant_yml](examples/vagrant_yml) directory of this project.

See the Project Wiki (coming soon!) for detailed configuration documentation.

## Supported vagrant capabilities

The Vagrantfile currently supports the following vagrant capabilities:

* Vagrant versions
    * 1.4.x
    * 1.5.x
* Box formats
    * Traditional vagrant boxes (pre-vagrant-cloud)
    * Vagrant cloud (vagrant version >= 1.5.0 required)
* Guests
    * Linux
* Multiple machine configurations
* Networking
    * Bridged (Public)
    * Host-only (Private)
* Providers (partial support for provider-specific settings)
    * Virtualbox
    * VMWare fusion
* Provisioners
    * Shell
    * Puppet

## Upcoming capabilities

Future plans include support for:

* Windows guest support through the vagrant-windows plugin
* Plugin configuration
* Enhanced provider-specific configuration
* Project-level default settings with node-level overrides
