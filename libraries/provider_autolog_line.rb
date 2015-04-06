require 'chef/provider/lwrp_base'

class Chef
  class Provider
    # Class information goes here.
    class ComposerInstall < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)
      def whyrun_supported?
        true
      end
      configuration_core = String.new
      action :create do
        autolog_line = String.new
        options_hash = new_resource.options
        options_hash.each do |key, value|
          if options_hash[key]
            autolog_line = autolog_line + key + '=' + value + ' '
          end
        end
        boolean_attributes = %w(
          hard
          mail
          clear
          warn
          log)
        boolean_attributes.each do |bravo|
          if bravo
            autolog_line = autolog_line + bravo + ' '
          elsif !bravo
            autolog_line = autolog_line + 'no' + bravo
          end
        end
        configuration_core = configuration_core + autolog_line + "\n"
      end

      template '/etc/autolog.conf' do
        source 'autolog.conf.erb'
        owner 'root'
        group 'root'
        mode 0644
        variables({
          :configuration_core => configuration_core
          })
      end
    end
  end
end
