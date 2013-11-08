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

TODO - get specific sha
 - change execute to git?/



##Graphite
###Attributes

default.rb 
	default['graphite']['timezone']

graphite.rb 
	default['graphite']['timezone']

carbon_aggregator.rb
	default['graphite']['storage_aggregation']

carbon_cache.rb
	default['graphite']['storage_schemas']


Requirements
========
Need chef client and ruby installed
* Latest version of chef TODO
* ruby 1.9.3


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

