#
# Cookbook Name:: flask
# Recipe:: flask
#
# Copyright 2015, sentient decision science
#
# All rights reserved - Do Not Redistribute
#

# create a user for the API
user 'flask' do
  supports :manage_home => true
  comment 'Flask User'
  uid 1234
  gid 'www-data'
  home '/home/flask'
  shell '/bin/bash'
  password 'pass'
end

# create a Python 2.7 virtualenv
python_virtualenv "/home/flask/venv" do
  interpreter "python2.7"
  owner "flask"
  group "users"
  action :create
end

# Install mysql driver for python
python_pip "MySQL-python" do
  action :install
  virtualenv "/home/flask/venv"
end

# Install flask framework
python_pip "flask" do
  action :install
  virtualenv "/home/flask/venv"
end

python_pip "requests" do
  action :install
  virtualenv "/home/flask/venv"
end

python_pip "flask-cors" do
  action :install
  virtualenv "/home/flask/venv"
end

# Install numpy
python_pip "numpy" do
  action :install
  virtualenv "/home/flask/venv"
end

# Install uwsgi
python_pip "uwsgi" do
  action :install
  virtualenv "/home/flask/venv"
end

# Install Source

link "/home/flask/adv_api.py"do
  to "/home/vagrant/chef-repo/sds_adv_api/adv_api.py" 
end

link "/home/flask/my_wsgi.py"do
  to "/home/vagrant/chef-repo/sds_adv_api/my_wsgi.py" 
end

template '/etc/init/adv_api.conf' do
  source 'adv_api.conf.erb'
  cookbook 'linux_web_stack'
  mode '0644'
  owner 'root'
  group 'root'
end

template '/home/flask/adv_api.ini' do
  source 'adv_api.ini.erb'
  cookbook 'linux_web_stack'
  mode '0644'
  owner 'root'
  group 'root'
end

template '/home/flask/adv_api.flask.cfg' do
  source 'adv_api.flask.cfg.erb'
  cookbook 'linux_web_stack'
  mode '0644'
  owner 'root'
  group 'root'
end

service "adv_api" do
  action :start
end
