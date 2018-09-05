username = "dozen"

user username do
  manage_home true
  shell "/bin/bash"
end

directory "/home/#{username}/.ssh" do
  mode 0700
  owner username
end

remote_file "/home/#{username}/.ssh/authorized_keys" do
  mode 0600
  owner username
  source "https://github.com/#{username}.keys"
  action :create_if_missing
end
