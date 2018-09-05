#!/bin/bash -x


CHEF_VERSION="13.5.3"

function install_chef() {
	if [[ $(grep ID_LIKE /etc/os-release) =~ (rhel|fedora) ]]; then
		yum install -y ruby ruby-devel curl git
		FILE_NAME="chef-${CHEF_VERSION}-1.el7.x86_64.rpm"
		URL="https://packages.chef.io/files/stable/chef/${CHEF_VERSION}/el/7/$FILE_NAME"
		curl -L $URL -O
		rpm -U $FILE_NAME
	fi

	if [[ $(grep ID /etc/os-release) =~ ubuntu ]]; then
	    apt-get install -y ruby ruby-dev curl git
	    FILE_NAME="chef_${CHEF_VERSION}-1_amd64.deb"
	    OS_VERSION="$(eval "$(cat /etc/os-release) echo \$VERSION_ID")"
	    URL="https://packages.chef.io/files/stable/chef/${CHEF_VERSION}/ubuntu/${OS_VERSION}/${FILE_NAME}"
	    curl -L -O "${URL}"
	    echo $URL
	    dpkg -i $FILE_NAME
	fi
}

[[ $(which chef-client) ]] || install_chef

[[ -f /etc/sudoers.d/wheel ]] || echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel

[[ -d /root/.ssh ]] || mkdir /root/.ssh && chmod 700 /root/.ssh
egrep -q "^Host github.com" /root/.ssh/config || echo -e "StrictHostKeyChecking no\nHost github.com\n  Compression yes" >> /root/.ssh/config

bash set-host.sh
