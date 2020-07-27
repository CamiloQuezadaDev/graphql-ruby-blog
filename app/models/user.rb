class User < ApplicationRecord
    has_secure_password

    EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    validates :name, presence: true 

    validates :email, presence: true, uniqueness: true
    validates_format_of :email, :with => EMAIL_REGEXP
    
    validates :password, length: {minimum: 7, maximum: 12 }

    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy 
    has_many :claps, dependent: :destroy 
end
