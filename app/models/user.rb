class User < ApplicationRecord
    has_many :listings   
    validates :name, :email, presence: true
    
end
