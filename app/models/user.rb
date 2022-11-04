# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  authentication_token :string
#  email                :string
#  first_name           :string
#  last_name            :string
#  password_digest      :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  #Associations

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy 
  has_many :claps, dependent: :destroy 
  has_many :favorites, dependent: :destroy 
  has_many :favorite_posts, through: :favorites, source: :post

  #validations

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => EMAIL_REGEXP
  validates :password, length: {minimum: 7, maximum: 12 }


  #callbacks
  before_create :generate_authentication_token

  def full_name
    "#{first_name} #{last_name}"
  end


  private

    def generate_authentication_token
      if self.authentication_token.nil?
        token = ''
        loop do
          token = AuthToken.token_for_user(self)
          break token if !User.where(authentication_token: token).exists?
        end
        self.authentication_token = token
      end
    end

end
