class CreateClaps < ActiveRecord::Migration[6.0]
  def change
    create_table :claps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
