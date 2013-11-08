Overview
========
Monitoring cookbook repository needs to be located @ `/root/monitoring` for chef-solo to run it - see solo.rb file

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
Attributes

default.rb 
	default['graphite']['timezone'] = 'UTC'

graphite.rb 
	default['graphite']['timezone'] = 'UTC'

carbon_aggregator.rb
	default['graphite']['storage_aggregation'] = [
		{
			'name' => 'min', 
			'pattern' => '\.lower$', 
			'xFilesFactor' => '0.1', 
			'aggregationMethod' => 'min'
		},
		{
			'name' => 'max', 
			'pattern' => '\.upper$', 
			'xFilesFactor' => '0.1', 
			'aggregationMethod' => 'max'
		},
		{
			'name' => 'sum', 
			'pattern' => '\.sum$', 
			'xFilesFactor' => '0', 
			'aggregationMethod' => 'sum'
		},
		{
			'name' => 'count', 
			'pattern' => '^stats_counts.*', 
			'xFilesFactor' => '0', 
			'aggregationMethod' => 'sum'
		},
		{
			'name' => 'default_average', 
			'pattern' => '.*', 
			'xFilesFactor' => '0.3', 
			'aggregationMethod' => 'average'
		}
	]

carbon_cache.rb
	default['graphite']['storage_schemas'] = [
		{
			'name' => 'stats', 
			'pattern' => '^stats.*', 
			'retentions' => '10s:6h,1min:7d,10min:5y'
		},
		{
			'name' => 'catchall', 
			'pattern' => '^.*', 
			'retentions' => '60:100800,900:63000'
		}
	]


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

