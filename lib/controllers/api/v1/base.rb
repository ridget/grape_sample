module Api
  module V1
    class Base < Grape::API
      # version 'v1'
      version 'v1'
      format :json
      mount Api::V1::Demo
    end
  end
end
