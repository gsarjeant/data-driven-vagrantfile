# Mount the containing directory so that it can be treated
# as a module by 'puppet apply'
#
# NOTE: This assumes the modulepath will include 'C:\modules\site'
#
def mount_directory_as_puppet_module(node)
  root_dir = File.dirname(__FILE__)
  dirname = File.basename( File.expand_path( '..', root_dir ) )
  module_name = dirname.split('-')[-1]

  node.vm.synced_folder '.', "/modules/site/#{module_name}"
end
