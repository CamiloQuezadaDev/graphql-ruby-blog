class Post < ApplicationRecord
    validates_presence_of :title, :content

    belongs_to :user 
    has_many :comments, dependent: :destroy
    has_many :claps, dependent: :destroy 

    has_many :favorites, dependent: :destroy 
    has_many :favorited_by, through: :favorites, source: :user
end
