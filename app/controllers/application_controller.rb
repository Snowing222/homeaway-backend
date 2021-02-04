class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, ENV['JWT_TOKEN'])
    end

end
