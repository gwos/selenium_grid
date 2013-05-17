default['selenium_grid']['version'] = '2.26.0'
default['selenium_grid']['file'] = "selenium-server-standalone-#{node['selenium_grid']['version']}.jar"
default['selenium_grid']['download_url'] = "http://selenium.googlecode.com/files/#{node['selenium_grid']['file']}"
default['selenium_grid']['host_url'] = "example.com"
default['selenium_grid']['source_file'] = "selenium-grid.jar"
