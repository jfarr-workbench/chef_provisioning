mysql_service 'default' do
  port node['linux_web_stack']['mysql']['port'] 
  socket node['linux_web_stack']['mysql']['socket']
  version '5.5'
  initial_root_password node['mysql']['server_root_password']
  action [:create, :start]
end

mysql_config 'default' do
  cookbook 'linux_web_stack'
  source 'mysite.cnf.erb'
  notifies :restart, 'mysql_service[default]'
  action :create
end

mysql_client 'default' do
  action :create
end

mysql2_chef_gem 'default' do
  action :install
end