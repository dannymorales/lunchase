class AddLongitudeLatitudeToLunchSpecials < ActiveRecord::Migration
  def change
  	add_column :lunch_specials, :latitude, :float
  	add_column :lunch_specials, :longitude, :float
  end
end
