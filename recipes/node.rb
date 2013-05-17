cache_dir = Chef::Config[:file_cache_path]

remote_file "#{cache_dir}/#{node["selenium_grid"]["source_file"]}" do
    source node["selenium_grid"]["download_url"]
    owner "ubuntu"
    group "ubuntu"
    mode "0644"
    action :create_if_missing
end

template "#{cache_dir}/nodeConfig.json" do
    source "nodeConfig.json.erb"
    owner "ubuntu"
    group "ubuntu"
    mode "0644"
end

bash "run selenium grid on node with url: #{node['selenium_grid']['host_url']}" do
    user "ubuntu"
    code <<-EOH
        export DISPLAY=:1
        daemonize /usr/bin/java -jar #{cache_dir}/#{node['selenium_grid']['source_file']} -role node -hub http://#{node['selenium_grid']['host_url']}:4444/grid/register -nodeConfig #{cache_dir}/nodeConfig.json
    EOH
end
