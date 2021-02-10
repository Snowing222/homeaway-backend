class ListingSerializer < ActiveModel::Serializer
  # include User

  attributes :id, :title, :property_id, :price, :avail_date_begin, :avail_date_end, :avail_period, :trade_mode, :rent_mode, :strict_mode, :user
  belongs_to :property

  def user
    user = object.property.user
    # user.active_model_serializer.new(user, {}).to_json
  end
  
end

