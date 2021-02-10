class Api::V1::PropertiesController < ApplicationController
    def index
        @properties = Property.all
        render json: @properties
    end

    def create

        @user = User.find_by(id: property_params[:user_id])
        if @user
            @property =  @user.properties.build(photo_src: property_params[:photosrc],
                                  description: property_params[:description],
                                  bedroom_number: property_params[:bedroomNumber],
                                  bathroom_number: property_params[:bathroomNumber],
                                  guest_number: property_params[:guestNumber],
                                  address: property_params[:address],
                                  state: property_params[:state],
                                  zipcode: property_params[:zipcode] 
                                 )
            if @property.save
                render json: @property, serializer: PropertyonlySerializer
            else
                render json: {errors: @property.errors.full_messages}, status: :not_acceptable
            end
        else
            render json: {errors: "No user"}, status: :not_acceptable
        end

    end

    private
    def property_params
        params.require(:property).permit(:user_id, :photosrc, :description, :bedroomNumber, :bathroomNumber, 
            :guestNumber, :address, :state, :zipcode)
    end
end


