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

#  yum_repository 'webtatic' do
#    name 'webtatic'
#    description 'webtatic'
#    url node['yum']['webtatic']['repo_url'] if node['yum']['webtatic']['mirror_url'].nil?
#    gpgkey node['yum']['webtatic']['key_url']
#    mirrorlist node['yum']['webtatic']['mirror_url']
#    action :add
#  end

# with webtatic got:
#[root@default-centos-66 ~]# mysql --version
#mysql  Ver 14.14 Distrib 5.1.73, for redhat-linux-gnu (x86_64) using readline 5.1
#[root@default-centos-66 ~]# php --version
#PHP 5.3.3 (cli) (built: Oct 30 2014 20:12:53)
#Copyright (c) 1997-2010 The PHP Group
#Zend Engine v2.3.0, Copyright (c) 1998-2010 Zend Technologies


package 'postfix' do
  action :remove
end

package 'mysql-libs' do
  action :remove
end
