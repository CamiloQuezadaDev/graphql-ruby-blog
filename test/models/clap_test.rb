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
require 'test_helper'

class ClapTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
