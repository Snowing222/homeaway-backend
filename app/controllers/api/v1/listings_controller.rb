class Api::V1::ListingsController < ApplicationController
    def index
        @listings = Listing.all
        render json: @listings
    end

    def show
        @listing = Listing.find_by(id: params[:id])
        if @listing
            render json: @listing
        else
            render json: {error: "Unavailable Listing"}
        end
    end

    def destroy
        @listing = Listing.find_by(id: params[:id])
        @listing.destroy
    end

    def create
        @user = User.find_by(id: params[:id])
        @listing = @user.listings.build(listing_params)
        if @listing.save
            render json: @listing
        else
            render json: {error: "Error create Listing"}
        end
    end

    private
    
    def listing_params
        params.require(:listing).permit(:price, :photo_src,:description, :avail_period, :avail_date_begin, :avail_date_end,
                                        :bedroom_number, :bathroom_number, :guest_number, :trade_mode, :strict_mode, :rent_mode,
                                        :address, :state, :zipcode, :create_at, :updated_at)
    end
end
