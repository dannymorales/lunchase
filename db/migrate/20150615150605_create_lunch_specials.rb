class CreateLunchSpecials < ActiveRecord::Migration
  def change
    create_table :lunch_specials do |t|
      t.string :title
      t.string :description
      t.string :restaurant
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :image_name
      t.string :image_content_type
      t.integer :image_file_size
      t.decimal :price
      t.integer :calories

      t.timestamps null: false
    end
  end
end
