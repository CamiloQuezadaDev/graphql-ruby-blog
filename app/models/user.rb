# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_name      :string
#  last_name       :string
#
class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates_presence_of :first_name
  validates_presence_of :last_name

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => EMAIL_REGEXP
    
  validates :password, length: {minimum: 7, maximum: 12 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy 
  has_many :claps, dependent: :destroy 


  has_many :favorites, dependent: :destroy 
  has_many :favorite_posts, through: :favorites, source: :post

  def full_name
    "#{first_name} #{last_name}"
  end

end
