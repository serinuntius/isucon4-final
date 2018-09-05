nssh="nssh-v0.0.2-linux-amd64"

bash "install nssh" do
  cwd "/tmp"
  code "unzip #{nssh}.zip && mv #{nssh} /usr/local/bin/nssh"
  notifies :create, "remote_file[/tmp/#{nssh}.zip]", :before
  not_if "[ -e /usr/local/bin/nssh ]"
end

remote_file "/tmp/#{nssh}.zip" do
  source "https://github.com/fujiwara/nssh/releases/download/v0.0.2/#{nssh}.zip"
  action :nothing
end
