require 'chef/provisioning'
 
machine 'appserver' do
 run_list ['testapp::deploy']
 attribute ['testapp', 'user'], 'ubuntu'
 attribute ['testapp', 'path'], '/var/opt'
 attribute ['testapp', 'db_location'], lazy { search(:node, "name:db").first['ipaddress'] }
end
 
ruby_block "print out public IP" do
 block do
 appservernode = search(:node, "name:appserver").first
 Chef::Log.info("Application can be accessed at http://#{appservernode['ec2']['public_ipv4']}:3001")
 end
end