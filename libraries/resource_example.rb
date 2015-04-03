require 'chef/resource/lwrp_base'

class Chef
  class Resource
    # Class information goes here.
    class ComposerInstall < Chef::Resource::LWRPBase
      self.resource_name = :composer_install
      actions :install
      default_action :install
    end
  end
end
