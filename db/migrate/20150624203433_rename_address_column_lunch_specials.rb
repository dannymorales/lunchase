class RenameAddressColumnLunchSpecials < ActiveRecord::Migration
  def change
  	rename_column :lunch_specials, :address, :location
  end
end
