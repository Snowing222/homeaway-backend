class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, ENV['JWT_TOKEN'],'HS256')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            puts "token", token
       
            begin 
                JWT.decode(token, "I have a secret", true, {algorithm: 'HS256'})
            rescue JWT::DecodeError
                []
            end
        end
    end



    def session_user    
        decoded_hash = decoded_token
        puts "decoded hash", decoded_hash
       
        if !decoded_hash.empty?
            user_id = decoded_hash[0]['user_id']
            puts "user_id", user_id
            @user = User.find_by(id: user_id)
        else
            puts "token is empty"
            nil
        end
    end

end
