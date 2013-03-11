dir = node[:keys][:path]

directory dir do
  owner node[:keys][:user]
  group node[:keys][:group]

  action :create
end

data_bag_item( node[:keys][:databag], node[:keys][:key_name] ).each do |k, v|
  next unless k.match(/^id_/)

  file "#{dir}/#{k}" do
    owner node[:keys][:user]
    group node[:keys][:group]
    mode k.match(/\.pub$/) ? "644" : "600"
    content v
  end
end
