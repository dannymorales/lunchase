class AddColumnsToLunchSpecials < ActiveRecord::Migration
  def change
  	add_column :lunch_specials, :restaurant, :string
  	add_column :lunch_specials, :location, :string
  end
end
