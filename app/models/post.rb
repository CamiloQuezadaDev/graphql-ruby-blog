# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Post < ApplicationRecord
    validates_presence_of :title, :content

    belongs_to :user 
    has_many :comments, dependent: :destroy
    has_many :claps, dependent: :destroy 

    has_many :favorites, dependent: :destroy 
    has_many :favorited_by, through: :favorites, source: :user
end
