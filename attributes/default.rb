default[:wordpress_cookbook][:app_name] = 'wordpress'
default[:wordpress_cookbook][:server_name] = 'localhost'
default[:wordpress_cookbook][:app_root] = "/var/www/#{node[:wordpress_cookbook][:app_name]}"
set[:apache][:docroot_dir] = default[:wordpress_cookbook][:app_root]
default[:mysql][:server_root_password] = 'securepassword'
default[:wordpress_cookbook][:db_password] = 'anothersecurepassword'
default[:wordpress_cookbook][:db_instance] = 'wp'


default[:repo][:remi][:url] = 'http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror'
set[:repo][:remi][:key] = 'RPM-GPG-KEY-remi'
default[:repo][:remi][:key_url] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'

# Attributes for webtatic repo
default[:yum][:webtatic][:repo_url] = nil
default[:yum][:webtatic][:mirror_url] = 'http://mirror.webtatic.com/yum/el6-archive/$basearch/mirrorlist'
default[:yum][:webtatic][:key_url] = 'http://repo.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy'
