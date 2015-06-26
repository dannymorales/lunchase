class AddColumnCityStateToLunchSpecials < ActiveRecord::Migration
  def change
  	add_column :lunch_specials, :city, :string
  	add_column :lunch_specials, :state, :string
  end
end
