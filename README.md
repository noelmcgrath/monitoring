Overview
========
Monitoring cookbook repository needs to be located @ `/root/monitoring` for chef-solo to run it - see solo.rb file

Have configured based on etsy configuration. This is important  to ensure no lost metrics and retention correctly done
-https://github.com/etsy/statsd/blob/master/docs/graphite.md

##Statsd
Statsd cookbook location on opscode is out of date and does not work

* Exception when installing debian package

- http://community.opscode.com/cookbooks/statsd

I have used a simpler cookbook from here

-https://github.com/josephholsten/statsd-cookbook

##Graphite
Have used the opscode community cookbook

* Version 0.4.3

-http://community.opscode.com/cookbooks/graphite

Updates to cookbook
===================
##Statsd

###Attributes

* statsd.rb 

New attributes added

	*default[:statsd][:repo] = "https://github.com/etsy/statsd.git"

	*default[:statsd][:sha] = "2ccde8266bbe941ac5f79efe39103b99e1196d92"

	*default[:statsd][:dir] = "/usr/share/statsd"

###Recipes

* default.rb
	* using git resources to clone repository instead of execute resource


##Graphite
###Attributes

* default.rb 

	* default['graphite']['timezone']

* graphite.rb 

	* default['graphite']['timezone']

* carbon_aggregator.rb

	* default['graphite']['storage_aggregation']

* carbon_cache.rb
	* default['graphite']['storage_schemas']


Requirements
========
Need chef client
* Latest version of chef can be installed using install-chef.sh file
* This will install chef via omnibus, which has its own embedded version of Ruby


ITS Notes
=========
Assumes curl installed - required to install chef client

Statsd
Port 8125 UDP
Port 8126  for monitoring
nodejs

Graphite
Apache, python
Web app django, sqllite db

Git

Apt

http required to require source

