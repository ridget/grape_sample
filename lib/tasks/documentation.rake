require 'bundler'
Bundler.require

ENV['RACK_ENV'] ||= 'development'

task :default => :spec

Dir[File.join(File.dirname(__FILE__), 'tasks/*.rake')].each { |f| load f }

require './api'

# Thanks @geoffreyd for the below
namespace :api do
  desc "Displays all API methods. Will output in Markdown Format"
  task 'routes' do
    Api::Base.routes.each do |route|
      route_path = route.route_path.gsub('(.:format)', '').gsub(':version', route.route_version)
      puts "### `#{route.route_method} #{route_path}`"
      puts " #{route.route_description}" if route.route_description
      if route.route_params.is_a?(Hash)
        params = route.route_params.map do |name, desc|
          required = desc.is_a?(Hash) ? desc[:required] : false
          description = desc.is_a?(Hash) ? desc[:desc] : desc.to_s
          type = desc.is_a?(Hash) ? desc[:type].to_s : ""
          spaces = "  " * name.count('[')
          [name, required, "   #{spaces}* #{name}: #{type} #{required ? '(required)' : ''} - #{description}"]
        end
        puts "\n  parameters:\n\n"
        # puts ''
        params.each { |p| puts p[2] }
      end
      puts "---\n\n"
    end
  end
end