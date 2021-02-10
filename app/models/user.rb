class User < ApplicationRecord
    has_many :properties
    has_many :listings, through: :properties
    
    validates :name, :email, presence: true
    validates :email, uniqueness: true
    has_secure_password

    def active_model_serializer
        UserSerializer
    end
    
    
end
