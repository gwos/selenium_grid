cache_dir = Chef::Config[:file_cache_path]

remote_file "#{cache_dir}/#{node["selenium_grid"]["source_file"]}" do
    source node["selenium_grid"]["download_url"]
    mode "0644"
    action :create_if_missing
end

bash "run grid in hub" do
    cwd cache_dir
    code "java -jar #{node['selenium_grid']['source_file']} -role hub &"
    not_if "ps aux | grep -v grep | grep selenium"
end
