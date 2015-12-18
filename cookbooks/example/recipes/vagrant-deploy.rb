require 'chef/provisioning'
 
myconfig = <<-EOM
  config.vm.network 'forwarded_port', guest: 3001, host: 3031
EOM
 
machine 'appserver' do
 add_machine_options :vagrant_config => myconfig
 run_list ['testapp::deploy']
 attribute ['testapp', 'user'], 'vagrant'
 attribute ['testapp', 'path'], '/home/vagrant'
 attribute ['testapp', 'db_location'], lazy { search(:node, "name:db").first['ipaddress'] }
end
 
ruby_block "print out public IP" do
 block do
   Chef::Log.info("Application can be accessed at http://localhost:3031")
 end
end