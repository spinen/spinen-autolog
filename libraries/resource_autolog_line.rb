require 'chef/resource/lwrp_base'

class Chef
  class Resource
    # Class information goes here.
    class AutologLine < Chef::Resource::LWRPBase
      self.resource_name = :autolog_line
      actions :create
      default_action :create
      attribute :switches, kind_of: Hash, default: { name: nil,
                                                     group: nil,
                                                     line: nil,
                                                     idle: nil,
                                                     grace: nil,
                                                     ban: nil }
      attribute :boolean_attributes, kind_of: Hash, default: { hard: false,
                                                               mail: false,
                                                               clear: true,
                                                               warn: true,
                                                               log: true }
    end
  end
end
