name             'wordpress_cookbook'
maintainer       'Aaron Blythe'
maintainer_email 'aaron.blythe@gmail.com'
license          'All rights reserved'
description      'Installs/Configures wordpress_cookbook'
long_description 'Installs/Configures wordpress_cookbook'
version          '0.1.0'

depends 'apache2'
depends 'mysql'
depends 'php'
depends 'database'
depends 'mysql2_chef_gem', '~> 1.0'
depends 'yum', '~> 3.0'
depends 'logrotate', '~> 1.6'
depends 'yum-epel'
