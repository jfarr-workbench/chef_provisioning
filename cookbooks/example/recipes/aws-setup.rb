require 'chef/provisioning/aws_driver'
with_driver 'aws'
 
  with_machine_options :bootstrap_options => {
  :key_name => 'chef-development-us-west',
  :associate_public_ip_address => true,
  :instance_type => 't2.micro'
}