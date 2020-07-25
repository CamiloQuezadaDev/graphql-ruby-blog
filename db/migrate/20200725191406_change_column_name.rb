class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :body, :content 
    rename_column :comments,:comment,:content 
  end
end
