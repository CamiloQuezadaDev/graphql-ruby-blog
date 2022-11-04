# == Schema Information
#
# Table name: claps
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_claps_on_post_id  (post_id)
#  index_claps_on_user_id  (user_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#  user_id  (user_id => users.id)
#
class Clap < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
