# == Schema Information
#
# Table name: claps
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Clap < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
