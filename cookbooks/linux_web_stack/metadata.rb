name             'linux_web_stack'
maintainer       'Jeff Farr'
maintainer_email 'jfarr@sentientdecisionscience.com'
license          'All rights reserved'
description      'Installs/Configures linux_web_stack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "git"
depends "nginx"
depends "mysql"
depends "php"
depends "php5-fpm"
depends "database"
depends "mysql2_chef_gem"
depends "gearman"
depends "phpunit"