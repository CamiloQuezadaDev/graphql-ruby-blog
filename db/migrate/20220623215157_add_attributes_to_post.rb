class AddAttributesToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :state, :string, default: 'pending'
    add_column :posts, :slug, :string
  end
end
