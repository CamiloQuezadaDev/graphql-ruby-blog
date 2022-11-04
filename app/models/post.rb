# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  slug       :string
#  state      :string           default("pending")
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Post < ApplicationRecord
  VALID_STATES = ['pending', 'procesing', 'completed']

  #Associations
  belongs_to :user 
  has_many :comments, dependent: :destroy
  has_many :claps, dependent: :destroy 

  has_many :favorites, dependent: :destroy 
  has_many :favorited_by, through: :favorites, source: :user

  #validations
  validates_presence_of :title, :content
  validates :state, inclusion: { in: VALID_STATES }

  #callbacks
  before_create :generate_slug
  before_update :generate_slug, if: :is_title_changed?

  #instance methods

  def posted_at
    created_at
  end

  def pending?
    state == 'pending'
  end

  def processing?
    state == 'procesing'
  end

  def completed?
    state == 'completed'
  end

  def pending!
    update_column(:state, 'pending')
  end

  def processing!
    update_column(:state, 'processing')
  end

  def completed!
    update_column(:state, 'completed')
  end

  def comment_count
    comments.count
  end

  def clap_count
    claps.count
  end

  private
    def generate_slug
      if (self.new_record? && Post.exists?(title: self.title)) || (!self.new_record? && Post.where(title: self.title).where.not(id: self&.id).exists?)
        self.slug = "#{title.to_s.parameterize}-#{SecureRandom.hex(5)}"
      else
        self.slug = title.to_s.parameterize
      end
    end

    def is_title_changed?
      self.title_changed?
    end
end
