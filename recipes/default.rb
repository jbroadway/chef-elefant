include_recipe "apache2"
include_recipe "mysql::server"
include_recipe "php"
include_recipe "php::module_sqlite3"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"

if node.has_key?("ec2")
	server_fqdn = node['ec2']['public_hostname']
else
	server_fqdn = node['fqdn']
end

if node['elefant']['version'] == 'latest'
	local_file = "#{Chef::Config[:file_cache_path]}/elefant-latest.tar.gz"
	unless File.exists?(local_file)
		remote_file "#{Chef::Config[:file_cache_path]}/elefant-latest.tar.gz" do
			source node['elefant']['latest_url']
			mode "0644"
		end
	end
else
	remote_file "#{Chef::Config[:file_cache_path]}/elefant-#{node['elefant']['version']}.tar.gz" do
		source "#{node['elefant']['archive_url']}/elefant_#{node['elefant']['version']}.tar.gz"
		mode "0644"
	end
end

directory node['elefant']['document_root'] do
	owner "root"
	group "root"
	mode "0755"
	action :create
	recursive true
end

execute "untar-elefant" do
	cwd node['elefant']['document_root']
	command "tar --strip-components 1 -zxf #{Chef::Config[:file_cache_path]}/elefant-#{node['elefant']['version']}.tar.gz"
	creates "#{node['elefant']['document_root']}/elefant"
	notifies :run, "execute[elefant-permissions]", :delayed
end

execute "elefant-permissions" do
	cwd node['elefant']['document_root']
	command "chmod 777 apps && chmod -R 777 cache conf css files lang layouts"
end

apache_site "000-default" do
	enable false
end

web_app "elefant" do
	template "elefant.conf.erb"
	document_root node['elefant']['document_root']
	server_name server_fqdn
	server_aliases node['elefant']['server_aliases']
end

