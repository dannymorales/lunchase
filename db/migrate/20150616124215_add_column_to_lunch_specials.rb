class AddColumnToLunchSpecials < ActiveRecord::Migration
  def change
  	add_column :lunch_specials, :restaurant_name, :string
  	add_column :lunch_specials, :restaurant_address, :string
  end
end
