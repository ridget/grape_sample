module Api
  require 'lib/controllers/api/v1/demo'
  require 'lib/controllers/api/v1/base'
  require 'lib/controllers/api/base'


  def self.routes_map
    map = {
        '/' => Api::Base
    }
    map
  end
end