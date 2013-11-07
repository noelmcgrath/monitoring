Overview
========
Statsd cookbook location on opscode (http://community.opscode.com/cookbooks/statsd) is located at https://github.com/jellybob/kitchen/tree/statsd
However as the opscode cookbook is behind this, I have got the cookbook directly from here.
monitoring cookbook needs to be located @ /root/monitoring for chef-solo to run it - see solo.rb file

Graphite coobook location on opscode (http://community.opscode.com/cookbooks/graphite)

Updates to cookbook
===================
Statsd

statsd\attributes\statsd.rb
	Updates
		default[:statsd][:package_version] = "0.5.0" to default[:statsd][:package_version] = "0.6.0"
		default[:statsd][:sha] = "96c488dc52a4f50fdf73343b8275e914be722655" to default[:statsd][:sha] = "2ccde8266bbe941ac5f79efe39103b99e1196d92"
		default[:statsd][:repo] = "git://github.com/etsy/statsd.git" to default[:statsd][:repo] = "https://github.com/etsy/statsd.git"

statsd\recipes\default.rb
		cookbook_file "/usr/share/statsd/scripts/start" do
			source "upstart.start"
			mode 0755
		end
	to
		cookbook_file "/usr/share/statsd/start" do
			source "upstart.start"
			mode 0755
		end

files/default/upstart.config 
		exec sudo -u statsd /usr/share/statsd/scripts/start
	to
		exec sudo -u statsd /usr/share/statsd/start



Graphite

attributes / default.rb 
		default['graphite']['timezone'] = 'America/Los_Angeles'
	to
		default['graphite']['timezone'] = 'America/Los_Angeles'




ITS Notes
=========

Statsd
	Port 8125
	nodejs

Graphite
	Apache, python
	Web app django

Git

Apt

http required to require source

