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
      attribute :hard, kind_of: [TrueClass, FalseClass], default: false
      attribute :mail, kind_of: [TrueClass, FalseClass], default: false
      attribute :clear, kind_of: [TrueClass, FalseClass], default: true
      attribute :warn, kind_of: [TrueClass, FalseClass], default: true
      attribute :log, kind_of: [TrueClass, FalseClass], default: true
    end
  end
end
