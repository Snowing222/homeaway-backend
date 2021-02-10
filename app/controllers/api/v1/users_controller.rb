class Api::V1::UsersController < ApplicationController
    def create  
        if User.find_by(email: params[:email])
            render json: {error: "User exists"}
        else
            @user = User.new(user_params)
            if @user.save
                payload = {user_id: @user.id}
                @token = encode_token(payload)
                render json: { user: UserSerializer.new(@user), jwt: @token }
            else
                render json: {errors: user.errors.full_messages}, status: :not_acceptable
            end 
        end   
    end
    
    def show
        @user = User.find_by(id: params[:id])
        if @user
            render json: @user
        else
            render json: {error: "Cannot find user"}
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
