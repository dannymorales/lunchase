class AddTaxesTrueToLunchSpecials < ActiveRecord::Migration
  def change
  	add_column :lunch_specials, :taxes, :boolean
  end
end
