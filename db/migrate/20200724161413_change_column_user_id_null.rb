class ChangeColumnUserIdNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :posts, :user_id, true 
  end
end
