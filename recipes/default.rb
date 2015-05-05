#
# Cookbook Name:: wordpress_cookbook
# Recipe:: default
#

include_recipe 'wordpress_cookbook::yum'
include_recipe 'wordpress_cookbook::apache'
include_recipe 'wordpress_cookbook::wordpress'
