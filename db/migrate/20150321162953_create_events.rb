class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :price
      t.string :category
      t.integer :rating
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
