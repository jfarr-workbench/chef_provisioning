mysql_database node['linux_web_stack']['database_name'] do
  connection(
    :host     => node['linux_web_stack']['mysql']['host'],
    :username => node['linux_web_stack']['mysql']['username'],
    :password => node['mysql']['server_root_password'],
    :socket   => node['linux_web_stack']['mysql']['socket'],
    :port     => node['linux_web_stack']['mysql']['port']
  )
  action :create
end

mysql_database_user node['linux_web_stack']['db_username'] do
  connection({
    :host => node['linux_web_stack']['mysql']['host'],
    :username => node['linux_web_stack']['mysql']['username'],
    :password => node['mysql']['server_root_password'],
    :socket   => node['linux_web_stack']['mysql']['socket'],
    :port     => node['linux_web_stack']['mysql']['port']
  })
  password node['linux_web_stack']['db_user_password']
  database_name node['linux_web_stack']['database_name']
  privileges [:select,:update,:insert,:create,:delete,:execute]
  action :grant
  notifies :restart, 'mysql_service[default]'
end

mysql_database_user node['linux_web_stack']['dba_username'] do
  connection({
    :host => node['linux_web_stack']['mysql']['db_host'],
    :username => node['linux_web_stack']['mysql']['username'],
    :password => node['mysql']['server_root_password'],
    :socket   => node['linux_web_stack']['mysql']['socket'],
    :port     => node['linux_web_stack']['mysql']['port']
  })
  password node['linux_web_stack']['dba_password']
  host node['linux_web_stack']['dba_host']
  database_name node['linux_web_stack']['database_name']
  privileges [:select,:update,:insert,:create,:delete,:execute]
  action :grant
  notifies :restart, 'mysql_service[default]'
end

mysql_database_user node['linux_web_stack']['da_systems_username'] do
  connection({
    :host => node['linux_web_stack']['mysql']['db_host'],
    :username => node['linux_web_stack']['mysql']['username'],
    :password => node['mysql']['server_root_password'],
    :socket   => node['linux_web_stack']['mysql']['socket'],
    :port     => node['linux_web_stack']['mysql']['port']
  })
  password node['linux_web_stack']['da_systems_password']
  host node['linux_web_stack']['da_systems_host']
  database_name node['linux_web_stack']['database_name']
  privileges [:select,:update,:insert,:create,:delete,:execute]
  action :grant
  notifies :restart, 'mysql_service[default]'
end
