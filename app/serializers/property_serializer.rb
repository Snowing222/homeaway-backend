class PropertySerializer < ActiveModel::Serializer
  attributes  :id,:user_id, :photo_src, :description, :bedroom_number, :bathroom_number, :guest_number, :address, :state,
  :zipcode, :listings

  has_many :listings

  def listings
      object.listings 
  end

  belongs_to :user
  
end


