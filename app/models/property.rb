class Property < ApplicationRecord
    has_many :listings, dependent: :destroy
    belongs_to :user
    validates :address, presence: true
end
