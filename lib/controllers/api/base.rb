module Api
  class Base < Grape::API
    prefix :api
    format :json
    mount Api::V1::Base
  end
end
