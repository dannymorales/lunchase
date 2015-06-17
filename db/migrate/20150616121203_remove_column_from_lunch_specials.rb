class RemoveColumnFromLunchSpecials < ActiveRecord::Migration
  def change
  	remove_column :lunch_specials, :restaurant, :string
  	remove_column :lunch_specials, :address, :string
  	remove_column :lunch_specials, :city, :string
  	remove_column :lunch_specials, :state, :string
  	remove_column :lunch_specials, :zip_code, :integer
  end
end
