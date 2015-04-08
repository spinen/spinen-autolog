name 'spinen-autolog'
maintainer 'Luke Reimer'
maintainer_email 'luke.reimer@spinen.com'
license 'MIT'
description 'Installs/Configures autolog'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version IO.read(File.join(File.dirname(__FILE__), 'VERSION'))
recipe 'default', 'Installs autolog'
recipe 'vagrant', 'includes the default but also excludes the vagrant user from being logged out'

supports 'ubuntu'
