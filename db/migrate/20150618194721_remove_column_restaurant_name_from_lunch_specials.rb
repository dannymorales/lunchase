class RemoveColumnRestaurantNameFromLunchSpecials < ActiveRecord::Migration
  def change
  	remove_column :lunch_specials, :restaurant_name, :string
  	remove_column :lunch_specials, :restaurant_address, :string
  end
end
