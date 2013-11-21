#!/bin/bash

# Pre-conditions
if [ "$(whoami)" == "root" ]; then
	echo "You must run this script as a non-root user !"
	exit 1
fi
if [ $# -ne 1 ]; then
	echo "Need 1 parameter !"
	echo "Usage is"
	echo "	./install-chef.sh proxy_ip_and_port"
	exit 1
fi
proxy_ip_and_port=$1

echo '# Configure http proxy for this bash session - asumes the same one for both http and https'
export http_proxy=http://$proxy_ip_and_port
export https_proxy=http://$proxy_ip_and_port

echo '# Install Chef'
# See http://www.opscode.com/chef/install/
curl -L https://www.opscode.com/chef/install.sh | sudo bash