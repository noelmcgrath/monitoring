#
# Cookbook Name:: graphite
# Attributes:: carbon_aggregator
#

default['graphite']['carbon']['aggregator']['line_receiver_interface'] = "0.0.0.0"
default['graphite']['carbon']['aggregator']['line_receiver_port'] = 2023
default['graphite']['carbon']['aggregator']['pickle_receiver_interface'] = "0.0.0.0"
default['graphite']['carbon']['aggregator']['pickle_receiver_port'] = 2024
default['graphite']['carbon']['aggregator']['destinations'] = []
default['graphite']['carbon']['aggregator']['replication_factor'] = 1
default['graphite']['carbon']['aggregator']['max_queue_size'] = 10000
default['graphite']['carbon']['aggregator']['use_flow_control'] = "True"
default['graphite']['carbon']['aggregator']['max_datapoints_per_message'] = 500
default['graphite']['carbon']['aggregator']['max_aggregation_intervals'] = 5

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

default['graphite']['aggregation_rules'] = []
