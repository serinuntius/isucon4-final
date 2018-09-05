
bash "install gpg key and repo" do
  code <<EOC
wget -qO - https://openresty.org/package/pubkey.gpg | apt-key add -
apt-get -y install software-properties-common
add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"
apt-get update
EOC
end

bash "install openresty" do
  code "apt-get install -y openresty"
  not_if "dpkg -l openresty"
  notifies :before, "bash[install gpg key and repo]"
end

service "openresty" do
  action :enable, :start
end
