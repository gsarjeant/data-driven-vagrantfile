data-driven-vagrantfile/external\_functions
===========================================

This directory may optionally contain one or more ruby files (.rb), which define
functions that may be executed while creating vagrant VMs. This allows the Vagrantfile
to support more dynamic operations than simply setting node parameters from data,
without requiring the Vagrantfile itself to be edited.

## How does it work?

You can enable your project to use ruby functions by doing the following

* Create a directory called external\_functions in the project's root (the directory that contains the Vagrantfile)
* Add one or more .rb files to this directory, containing your functions
* Create an "external\_functions:" key on each node in your vagrant.yml file for which you want to call external functions
    * The value of this key should be an array
    * Each element of the array should be the name of a function that is defined in one of your ruby files

If an external\_functions directory exists and contains one or more .rb file, the Vagrantfile
will automatically load any functions defined in those files. You may then use those functions
when provisioning Vagrant VMs by creating an external\_functions key as described above.

The Vagrantfile will pass the current node to the function, so that you can manipulate its
configuration in your function.

See the external\_functions.yml example file for an example of how to do this.
