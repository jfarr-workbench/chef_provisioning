log_level	:info
current_dir = File.dirname(__FILE__)
node_name	"provisioner"
client_key	"#{current_dir}/dummy.pem"
validation_client_name	"validator"
knife[:ssh_user] = "ubuntu"
knife[:aws_ssh_key_id] = 'chef-development-us-west'
private_keys	'chef-development-us-west' => '/Users/jfarr-sds/.ssh/chef-development-us-west.pem'
public_keys	'chef-development-us-west' => '/Users/jfarr-sds/.ssh/chef-development-us-west.pub'
