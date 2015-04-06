name 'spinen-autolog'
maintainer 'Luke Reimer'
maintainer_email 'luke.reimer@spinen.com'
license 'MIT'
description 'Installs/Configures autolog'
version '0.1.0'
recipe 'default', 'Installs autolog'
recipe 'vagrant', 'includes the default but also excludes the vagrant user from being logged out'

supports 'ubuntu'

