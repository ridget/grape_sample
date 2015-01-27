module Api
  module V1
    class Demo < Grape::API
      resource :demo do
        desc "Hello world"
        get :hello do
          {hello: "world"}
        end


      end
    end
  end
end