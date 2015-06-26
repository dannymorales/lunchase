class RenameLocationColumnLunchSpecials < ActiveRecord::Migration
  def change
  	rename_column :lunch_specials, :location, :address
  end
end
