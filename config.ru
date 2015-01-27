require 'bundler'
Bundler.require

$: << File.dirname(__FILE__)

require_relative 'api'

# If youre using activerecord
# use ActiveRecord::ConnectionAdapters::ConnectionManagement

use Rack::Session::Cookie
run Rack::URLMap.new Api.routes_map
