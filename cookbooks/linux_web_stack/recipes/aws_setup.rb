require 'chef/provisioning/aws_driver'
with_driver 'aws'
 
  with_machine_options :bootstrap_options => {
  :image_id => "ami-858798e4", # trusty64 hvm ssd
  :key_name => 'chef-development-us-west',
  :associate_public_ip_address => true,
  :instance_type => 't2.micro'
}

# todo: attach EBS stores, capture mount point, create data dir, merge into config files