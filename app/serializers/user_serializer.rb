class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :properties
  # has_many :listings, through: :properties


end
