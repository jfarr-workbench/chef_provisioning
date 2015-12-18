default["linux_web_stack"]["user"] = 'vagrant'
default['linux_web_stack']['environment'] = "qa"

default["linux_web_stack"]["database_name"] = 'api-prime'
default["linux_web_stack"]["db_username"] = 'api-prime'
default["linux_web_stack"]["dba_username"] = 'dba'
default["linux_web_stack"]["dba_password"] = 'hd7ejs83trhvie'
default["linux_web_stack"]["dba_host"] = '%'
default["linux_web_stack"]["da_systems_username"] = 'da-systems'
default["linux_web_stack"]["da_systems_password"] = 'password'
default["linux_web_stack"]["da_systems_host"] = '%'

default["linux_web_stack"]['mysql']["host"] = '127.0.0.1'
default["linux_web_stack"]['mysql']["username"] = 'root'
default["linux_web_stack"]['mysql']["port"] = '3306'
default["linux_web_stack"]['mysql']["socket"] = '/var/run/mysqld/mysqld.sock'

default["linux_web_stack"]["app"]["checkout_dir"] = "/home/" + default["linux_web_stack"]["user"] + "/chef-repo/Sentient-Prime-Survey-API/"

node.default["php_fpm"]["pools"] = 
'{ 	"www":
	{
		"user": "fpm_user",
		"group": "fpm_group",
		"listen": "/var/run/php5-fpm.sock",
		"pm": "dynamic",
		"pm.max_children": "10",
		"pm.start_servers": "4",
		"pm.min_spare_servers": "2",
		"pm.max_spare_servers": "6",
		"pm.process_idle_timeout": "10s",
		"pm.max_requests": "0",
		"pm.status_path": "/status",
		"ping.path": "/ping",
		"ping.response": "/pong",
		"access.format": "%R - %u %t \"%m %r\" %s",
		"request_slowlog_timeout": "0",
		"request_terminate_timeout": "0",
		"chdir": "/",
		"catch_workers_output": "no",
		"security.limit_extensions": ".php",
		"access.log": "NOT_SET",
		"slowlog": "NOT_SET",
		"rlimit_files": "NOT_SET",
		"rlimit_core": "NOT_SET",
		"chroot": "NOT_SET"
	}
}'

node.default['phpunit']['install_method'] = 'phar'
