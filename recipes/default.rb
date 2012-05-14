dir = "/home/vagrant/.ssh"

directory dir do
  owner "vagrant"
  group "vagrant"
  action :create
end

data_bag_item( node[:keys][:databag], node[:keys][:key_name] ).each do |k, v|
 next unless k.match(/^id_/)
  
  file "#{dir}/#{k}" do
    owner "vagrant"
    group "vagrant"
    mode k.match(/\.pub$/) ? "644" : "600"
    content v
  end
end

data_bag_item( node[:keys][:databag], node[:keys][:key_name] ).each do |k, v|
  next unless k.match(/^known_/)
  
  file "#{dir}/#{k}" do
    owner "vagrant"
    group "vagrant"
    content v
  end
end

dir = "/root/.ssh"

directory dir do
  owner "root"
  group "root"
  action :create
end


data_bag_item( node[:keys][:databag], node[:keys][:key_name] ).each do |k, v|
  next unless k.match(/^id_/)
  
  file "#{dir}/#{k}" do
    owner "root"
    group "root"
    mode k.match(/\.pub$/) ? "644" : "600"
    content v
  end
end

data_bag_item( node[:keys][:databag], node[:keys][:key_name] ).each do |k, v|
  next unless k.match(/^known_/)
  
  file "#{dir}/#{k}" do
    owner "root"
    group "root"
    content v
  end
end