default[:alp] = {
  :base_uri => "https://github.com/tkuchiki/alp/releases/download/v%{version}/alp_%{os}_%{arch}.zip",
  :bin      => "/usr/local/bin/alp",
  :version  => "0.3.1",
}

uri = {
  :version => node[:alp][:version],
  :os      => node[:os],
  :arch    => node[:kernel][:machine] == "x86_64" ? "amd64" : "386",
}

default[:alp][:download_uri] = node[:alp][:download_uri] || node[:alp][:base_uri] % uri
