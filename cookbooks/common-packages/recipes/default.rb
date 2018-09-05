package "vim"
package "the_silver_searcher" do
  only_if { platform_family?("rhel") }
end
package "silversearcher-ag" do
  only_if { platform_family?("debian") }
end
package "jq"
package "git"
package "subversion"
package "net-tools"
package "telnet"
package "iotop"
package "iftop"
package "htop"
package "dstat"
package "mosh"
package "tmux"
package "make"
package "socat"
package "siege"
