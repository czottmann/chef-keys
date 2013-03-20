dir = "/home/#{ node['keys']['user'] }/.ssh"

directory dir do
  owner #{ node['keys']['user'] }
  group #{ node['keys']['user'] }
  action :create
end

data_bag_item( #{ node['keys']['databag'] }, #{ node['keys']['key_name'] } ).each do |k, v|
 next unless k.match(/^id_/)

  file "#{dir}/#{k}" do
    owner #{ node['keys']['user'] }
    group #{ node['keys']['user'] }
    mode k.match(/\.pub$/) ? "644" : "600"
    content v
  end
end

data_bag_item( #{ node['keys']['databag'] }, #{ node['keys']['key_name'] } ).each do |k, v|
  next unless k.match(/^known_/)

  file "#{dir}/#{k}" do
    owner #{ node['keys']['user'] }
    group #{ node['keys']['user'] }
    content v
  end
end

dir = "/root/.ssh"

directory dir do
  owner "root"
  group "root"
  action :create
end


data_bag_item( #{ node['keys']['databag'] }, #{ node['keys']['key_name'] } ).each do |k, v|
  next unless k.match(/^id_/)

  file "#{dir}/#{k}" do
    owner "root"
    group "root"
    mode k.match(/\.pub$/) ? "644" : "600"
    content v
  end
end

data_bag_item( #{ node['keys']['databag'] }, #{ node['keys']['key_name'] } ).each do |k, v|
  next unless k.match(/^known_/)

  file "#{dir}/#{k}" do
    owner "root"
    group "root"
    content v
  end
end
