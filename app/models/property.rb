class Property < ApplicationRecord
    has_many :listings
    belongs_to :user
    validates :address, presence: true
end
