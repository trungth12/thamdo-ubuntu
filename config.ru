# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'rack'
require 'rack/cache'
require 'redis-rack-cache'
 
use Rack::Cache,
metastore: 'redis://localhost:6379/1/metastore',
entitystore: 'redis://localhost:6379/1/entitystore'

run Thamdo::Application
