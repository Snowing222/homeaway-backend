class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, ENV['JWT_TOKEN'])
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            puts "2.token", token
       
            begin 
                decoded_token = JWT.decode(token, ENV['JWT_TOKEN'])
                puts "3.decoded_token", decoded_token
                return decoded_token
            rescue JWT::DecodeError
                puts "4.decode error"
                []
            end
        end
    end



    def session_user    
        decoded_hash = decoded_token
        puts "4.decoded hash", decoded_hash
       
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
