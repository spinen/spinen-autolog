require 'chef/provider/lwrp_base'

class Chef
  class Provider
    # Class information goes here.
    class AutologLine < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)
      def whyrun_supported?
        true
      end
      configuration_core = ''
      action :create do
        service 'autolog' do
          supports restart: true
        end

        autolog_line = ''
        switches_hash = new_resource.switches
        switches_hash.each do |key, value|
          if switches_hash[key]
            autolog_line = autolog_line + key.to_s + '=' + value + ' '
          end
        end
        new_resource.boolean_attributes.each do |key, value|
          if value
            autolog_line = autolog_line + key.to_s + ' '
          elsif !value
            autolog_line = autolog_line + 'no' + key.to_s + ' '
          end
        end
        configuration_core = configuration_core + autolog_line + "\n"

        template '/etc/autolog.conf' do
          source 'autolog.conf.erb'
          owner 'root'
          group 'root'
          mode 0644
          variables(configuration_core: configuration_core)
          notifies :restart, 'service[autolog]'
        end
      end
    end
  end
end
