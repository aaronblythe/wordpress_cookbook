#
# Cookbook Name:: wordpress_cookbook
# Recipe:: wordpress
#


ruby_block "install_wordpress" do
  block do
    require 'fileutils'
    FileUtils.cd node[:wordpress_cookbook][:app_root]
    system 'wget https://wordpress.org/latest.tar.gz --no-check-certificate'
    system 'tar -xzf latest.tar.gz --strip-components=1 && rm latest.tar.gz'
  end
  not_if { ::File.exist?(File.join(node[:wordpress_cookbook][:app_root], 'wp-settings.php')) }
  action :create
end

template("#{node[:wordpress_cookbook][:app_root]}/wp-config.php") do
  source("wp-config.php.erb")
  variables(
    db_name: node[:wordpress_cookbook][:app_name],
    db_user: node[:wordpress_cookbook][:app_name],
    db_password: node[:wordpress_cookbook][:db_password]
  )
end

execute "set_apache_as_owner" do
  command "chown #{node['apache']['user']} -R #{node[:wordpress_cookbook][:app_root]}"
end
