include_recipe 'git'

user = node['linux_web_stack']['user']
checkout_dir = node["linux_web_stack"]["app"]["checkout_dir"]

if node['linux_web_stack']['environment'] != "development"
	git_key = Chef::EncryptedDataBagItem.load( "private_keys", "git_key" )

	file "/root/.ssh/git_key.pem" do
	  content git_key['private']
	  owner "root"
	  group "root"
	  mode 0600
	end

	template "/root/.ssh/config" do
	  source 'ssh.config.erb'
	  cookbook 'linux_web_stack'
	  mode '0644'
	  owner "root"
	  group "root"
	  variables({
		 :key_file => "/root/.ssh/git_key.pem"
	  })
	end

	# install API source code
	git checkout_dir do
	  repository "git@github.com:sentient-prime/Sentient-Prime-Survey-API.git"
	  revision "prime-663"
	  action :sync
	  user "root"
	end
end

# link the source to the deployment 
link "/var/vhosts/qa-prime" do
  to node["linux_web_stack"]["app"]["checkout_dir"]
end

bash "install_gearman_manager" do
	user "root"
	code <<-EOF
	exec /bin/bash #{node["linux_web_stack"]["app"]["checkout_dir"]}gearman-manager/install/install.sh
	EOF
end

link "/etc/gearman-manager/workers/gm_response.php" do
  to node["linux_web_stack"]["app"]["checkout_dir"] + "gearman_workers/gm_response.php"
end