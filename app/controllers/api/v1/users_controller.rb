class Api::V1::UsersController < ApplicationController
    def create
        @user = User.find_or_create_by(user_params)
        if @user
            render json: @user
        else 
            render json: {error: "Cannot create user"}
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
        params.require(:user).permit(:name, :email)
    end
end
