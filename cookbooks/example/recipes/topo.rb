require 'chef/provisioning'
 
machine 'db' do
  run_list ['apt','testapp::db']
end
 
machine 'appserver' do
  run_list ['apt','testapp::appserver']
end