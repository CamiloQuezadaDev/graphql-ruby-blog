class Post < ApplicationRecord
    validates_presence_of :title, :content

    belongs_to :user 
    has_many :comments 
end
