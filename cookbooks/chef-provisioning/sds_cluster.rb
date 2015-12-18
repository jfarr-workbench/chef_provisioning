require 'chef/provisioning/vagrant_driver'

vagrant_box 'trusty64' do
  url 'http://files.vagrantup.com/trusty64.box'
end

with_driver 'vagrant'

with_machine_options :vagrant_options => {
  'vm.box' => 'trusty64'
}

require 'chef/provisioning'

machine 'mario' do
  tag 'itsa_me'
  converge true
end