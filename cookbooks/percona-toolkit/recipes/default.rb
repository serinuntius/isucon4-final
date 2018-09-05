bash "install percona-toolkit" do
  code "yum install -y https://www.percona.com/downloads/percona-toolkit/3.0.4/binary/redhat/7/x86_64/percona-toolkit-3.0.4-1.el7.x86_64.rpm"
  only_if { platform_family?("rhel") }
  not_if "rpm -q percona-toolkit"
end

package "percona-toolkit" do
  only_if { platform_family?("debian") }
end
