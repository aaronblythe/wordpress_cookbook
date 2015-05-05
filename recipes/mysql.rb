#
# Cookbook Name:: wordpress_cookbook
# Recipe:: mysql
#


mysql_client 'default' do
  action :create
end

mysql2_chef_gem 'default' do
  client_version node['mysql']['version'] if node['mysql']
  action :install
end

mysql_service node[:wordpress_cookbook][:db_instance] do
  initial_root_password node[:mysql][:server_root_password]
  action [:create, :start]
end

socket = "/var/run/mysql-#{node[:wordpress_cookbook][:db_instance]}/mysqld.sock"

link '/var/lib/mysql/mysql.sock' do
  to socket
  not_if 'test -f /var/lib/mysql/mysql.sock'
end

# This is used repeatedly, so we'll store it in a variable
mysql_connection_info = {
  host:      node[:wordpress_cookbook][:server_name],
  username:  'root',
  password:  node[:mysql][:server_root_password],
  socket:    socket
}

# Ensure a database exists with the name of our app
mysql_database node[:wordpress_cookbook][:app_name] do
  connection mysql_connection_info
  action     :create
end

# Ensure a database user exists with the name of our app
mysql_database_user node[:wordpress_cookbook][:app_name] do
  connection    mysql_connection_info
  password      node[:wordpress_cookbook][:db_password]
  database_name node[:wordpress_cookbook][:app_name]
  host          node[:wordpress_cookbook][:server_name]
  action        :create
end

# Let this database user access this database
mysql_database_user node[:wordpress_cookbook][:app_name] do
  mysql_connection_info
  password      node[:wordpress_cookbook][:db_password]
  database_name node[:wordpress_cookbook][:app_name]
  host          node[:wordpress_cookbook][:server_name]
  privileges    [:all]
  action        :grant
end
