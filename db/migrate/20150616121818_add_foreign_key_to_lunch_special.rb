class AddForeignKeyToLunchSpecial < ActiveRecord::Migration
  def change
  	add_foreign_key :lunch_specials, :restaurants
  end
end
