class Post < ApplicationRecord
    validates_presence_of :title, :content

    belongs_to :user 
    has_many :comments, dependent: :destroy
    has_many :claps, dependent: :destroy 
end
