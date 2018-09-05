directory "/root/.ssh" do
  mode 0700
  user  "root"
  group "root"
end

cookbook_file "/root/.ssh/id_rsa" do
  source "id_rsa"
  mode 0600
  user "root"
  group "root"
end

cookbook_file "/root/.ssh/id_rsa.pub" do
  source "id_rsa.pub"
  mode 0644
  user "root"
  group "root"
end

cookbook_file "/root/.ssh/authorized_keys" do
  source "id_rsa.pub"
  mode 0644
  user "root"
  group "root"
end
