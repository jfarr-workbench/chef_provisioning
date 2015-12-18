require 'chef/provisioning'

with_machine_options :bootstrap_options => {
  :image_id => "ami-858798e4", # trusty64 hvm ssd
  :key_name => 'chef-development-us-west',
  :associate_public_ip_address => true,
  :instance_type => 't2.micro',
  :block_device_mappings => [{
    :device_name => "/dev/sda2",
    :ebs => {
      :volume_size => 8, # 8 GiB
      :delete_on_termination => true
    }
  }]
}

machine 'mysql_db' do
  attribute ['mysql', 'server_root_password'], 'password'
  attribute ['linux_web_stack', 'db_user_password'], 'bdfudgf93efgf1eguf'
  run_list ['insecure_bootstrap::encryption_keys_insecure', 
  'apt', 
  'linux_web_stack::mysql_database', 
  'linux_web_stack::init_prime_db'
  ]
end


# todo: remove app specific details from database cookbook, encrypt password data, 
# create generic mysql config recipe
# create specific mysql config files for each environment
# create mysql init recipe for production database
# create mysql init recipe for local db for gearman queue

# postgres primary, relay and remote backup
# cassandra cluster