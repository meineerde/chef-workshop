directory node['my_website']['base_path'] do
  owner "root"
  group "root"
  mode "0755"
  recursive true
end

template "#{node['my_website']['base_path']}/index.html" do
  source "index.html.erb"
  variables :greeting => node['my_website']['greeting']
  mode "0644"
end


web_app "vagrant.local" do
  docroot node['my_website']['base_path']

  template "apache.conf.erb"
  cookbook "my_website"
end

apache_site "000-default" do
  enable false
end
