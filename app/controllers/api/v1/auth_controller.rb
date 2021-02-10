class Api::V1::AuthController < ApplicationController
    def login
       @user = User.find_by(email: login_params[:email])
       if @user 
          if @user.authenticate(login_params[:password])
             payload = {user_id: @user.id}
             @token = encode_token(payload)
             render json: { user: UserSerializer.new(@user), jwt: @token }
          else
           
            render json: {errors: "incorrect password, Please try again"}, status: :not_acceptable
          end
        else
            render json: {errors: "Cannot find account, Please Sign Up"}, status: :not_acceptable
       end

    end

    def auto_login
        
        if session_user
          render json: { user: UserSerializer.new(@user) }
       
          
        end

    end

    private
    def login_params
        params.require(:user).permit(:email, :password)
    end
end
