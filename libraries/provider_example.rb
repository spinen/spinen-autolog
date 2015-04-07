require 'chef/provider/lwrp_base'

class Chef
  class Provider
    # Class information goes here.
    class ComposerInstall < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)
      def whyrun_supported?
        true
      end
      action :install do
        remote_file '/usr/local/bin/composer_installer.php' do
          source 'https://getcomposer.org/installer'
          action :create
          retries 5
        end

        unless ::File.exist?('/usr/local/composer')
          cmd_str = 'php /usr/local/bin/composer_installer.php'
          cmd_str2 = 'mv composer.phar /usr/local/bin/composer'
          execute cmd_str do
            Chef::Log.debug "composer_install: #{cmd_str}"
            Chef::Log.info 'Installing composer.'
            new_resource.updated_by_last_action(true)
          end
          execute cmd_str2 do
            Chef::Log.debug "composer_install: #{cmd_str2}"
            Chef::Log.info 'Making composer globally available.'
            new_resource.updated_by_last_action(true)
          end
        end
      end
    end
  end
end
