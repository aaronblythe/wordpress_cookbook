#
# Cookbook Name:: wordpress_cookbook
# Recipe:: yum
#

include_recipe 'yum-epel::default'

yum_repository 'remi' do
  description 'remi for Enterprise Linux'
  mirrorlist node['repo']['remi']['url']
  gpgkey node['repo']['remi']['key_url']
  action :create
end
