archives = File.basename(node[:alp][:download_uri])

bash "download alp #{node[:alp][:version]}" do
  cwd "/tmp"
  user "root"
  code <<-EOF
    curl -L "#{node[:alp][:download_uri]}" -O
    unzip #{archives}
    mv alp #{node[:alp][:bin]}
  EOF
  notifies :delete, "file[/tmp/#{archives}]"
  not_if   "#{node[:alp][:bin]} --version 2>&1 | grep -qs '#{node[:alp][:version]}'"
end

file "/tmp/#{archives}" do
  action :nothing
end
