require 'grape'
module API::V1
    class Base < Grape::API
        version 'v1', :path
        format :json
        mount API::V1::Library
    end
end
