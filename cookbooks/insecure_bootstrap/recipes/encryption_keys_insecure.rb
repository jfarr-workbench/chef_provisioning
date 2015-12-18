ssh_keys = data_bag_item('secrets', "encrypted_data_bag_secret")
key_name = "encrypted_data_bag_secret"

directory "/etc/chef/" do
  recursive true
end

file File.join("/etc/chef/", key_name) do
  content ssh_keys['private_ssh_key']
  sensitive true
end
