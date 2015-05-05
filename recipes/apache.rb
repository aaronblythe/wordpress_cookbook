#
# Cookbook Name:: wordpress_cookbook
# Recipe:: apache
#

include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe 'wordpress_cookbook::mysql'

directory node[:wordpress_cookbook][:app_root] do
  path node[:wordpress_cookbook][:app_root]
  owner node[:apache][:user]
  group node[:apache][:group]
  mode '0755'
end

web_app(node[:wordpress_cookbook][:app_name]) do
  server_name  node[:wordpress_cookbook][:server_name]
  server_alias node[:wordpress_cookbook][:server_alias]
  docroot      node[:wordpress_cookbook][:app_root]
  template     'vhost.conf.erb'
  enable true
end


#cookbook_file "#{node[:apache][:docroot_dir]}/hello.html" do
#  source "hello.html"
#  owner node[:apache][:user]
#  group node[:apache][:group]
#  mode '0755'
#  action :create
#  notifies :restart, 'service[apache2]'
#end
