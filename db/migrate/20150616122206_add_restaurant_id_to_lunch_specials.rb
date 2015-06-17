class AddRestaurantIdToLunchSpecials < ActiveRecord::Migration
  def change
  	add_column :lunch_specials, :restaurant_id, :integer
  end
end
