data-driven-vagrantfile
=======================

This project defines a Vagrantfile that reads all VM configuration from a file, vagrant.yml, that resides in the same directory as the Vagrantfile. You should be able to use the Vagrantfile without modification for most commonly used vagrant settings, defining your project settings in vagrant.yml. You can find detailed documentation of the vagrant settings at the [vagrant](http://www.vagrantup.com/) project's [documentation](http://docs.vagrantup.com/v2/) page. This project's documentation will focus on configuring vagrant.yml for supported settings.

There are a number of sample vagrant.yml files in the [examples/vagrant_yml](examples/vagrant_yml) directory of this project.

See the [Project Wiki](https://github.com/gsarjeant/data-driven-vagrantfile/wiki) for detailed configuration documentation.

## Why does this exist?

This began as a learning project: vagrant is an extermely powerful tool, but its syntax can be somewhat arcane, especially when defining multi-VM vagrant environments. I wanted to see how much of that syntax I could mask by making a generic Vagrantfile using only ruby functions in the Vagrantfile itself, and I also wanted a good starter ruby project. It's grown into something that has been handy for me on a number of occasions, and so I decided to polish it up somewhat and make it available.

There are other projects that allow you to configure vagrant with data, notably Adrien Thebo's [vagrant-config_builder](https://github.com/adrienthebo/vagrant-config_builder), which is more robust and more flexible than this. That project may better meet your needs, especially if you have sophisticated requirements for your vagrant project (though if this doesn't handle something that you want, by all means feel free to submit a PR or a bug report). For putting together a quick solution that uses common vagrant settings, you may find this to be useful as well. It requires no plugins: just drop the Vagrantfile in your project's root and define some VMs in vagrant.yml in the same directory.

## Supported vagrant capabilities

The Vagrantfile currently supports the following vagrant capabilities:

* Vagrant versions
    * 1.4.x
    * 1.5.x
* Box sources
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

* Vagrant 1.6+ support
* Windows guest support, either through the vagrant-windows plugin or natively (Vagrant 1.6+ only)
* Plugin configuration
* Enhanced provider-specific configuration
* Project-level default settings with node-level overrides
