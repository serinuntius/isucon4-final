directory "/home/#{node[:accounts][:app_user]}/.ssh" do
  mode 0700
  user  node[:accounts][:app_user]
  group node[:accounts][:app_user]
end

cookbook_file "/home/#{node[:accounts][:app_user]}/.ssh/id_rsa" do
  source "id_rsa"
  mode 0600
  user node[:accounts][:app_user]
  group node[:accounts][:app_user]
end

cookbook_file "/home/#{node[:accounts][:app_user]}/.ssh/id_rsa.pub" do
  source "id_rsa.pub"
  mode 0644
  user node[:accounts][:app_user]
  group node[:accounts][:app_user]
end

cookbook_file "/home/#{node[:accounts][:app_user]}/.ssh/authorized_keys" do
  source "id_rsa.pub"
  mode 0644
  user node[:accounts][:app_user]
  group node[:accounts][:app_user]
end
