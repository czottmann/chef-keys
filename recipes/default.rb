dir = "/home/chef/.ssh"

directory dir do
  owner "chef"
  group "chef"
  action :create
end

data_bag_item( node[:keys][:databag], node[:keys][:key_name] ).each do |k, v|
  next unless k.match(/^id_/)
  
  file "#{dir}/#{k}" do
    owner "chef"
    group "chef"
    mode k.match(/\.pub$/) ? "644" : "600"
    content v
  end
end
