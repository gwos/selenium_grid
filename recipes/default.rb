#
# Cookbook Name:: selenium_grid
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cache_dir = Chef::Config[:file_cache_path]

remote_file "#{cache_dir}/#{node['selenium_grid']['source_file']}" do
    source node['selenium_grid']['download_url'] 
    mode "0644"
    action :create_if_missing
end
