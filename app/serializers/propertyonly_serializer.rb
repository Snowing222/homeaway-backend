class PropertyonlySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :photo_src, :description, :bedroom_number, :bathroom_number, :guest_number, :address, :state,
  :zipcode
end
