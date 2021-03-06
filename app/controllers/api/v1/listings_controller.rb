class Api::V1::ListingsController < ApplicationController
    def index 
        if !!search_params[:avail_date_begin]
            @search_params = search_params.to_h
            @listings = Listing.filter_listing(@search_params)
        else
            @listings = Listing.all
        end
          
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
        if @listing && @listing.destroy
          render json: @listing
        else
          render json: {error: @listing.errors.full_messages}
        end

    end

    def create
    
        @property = Property.find_by(id: listing_params[:property_id])
        @listing = @property.listings.build(listing_params)
        if @listing.save
            render json: @listing
        else
            render json: {error: @listing.errors.full_messages}
        end
    end

    
    private
    
    def listing_params
        params.require(:listing).permit(:property_id, :title, :price, :photo_src,:description, :avail_period, :avail_date_begin, :avail_date_end,
                                        :bedroom_number, :bathroom_number, :guest_number, :trade_mode, :strict_mode, :rent_mode,
                                        :address, :state, :zipcode, :create_at, :updated_at)
    end

    def search_params
        params.permit(:avail_date_begin, :avail_date_end, :avail_period)
    end
end
