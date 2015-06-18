class AddUserIdToLunchSpecials < ActiveRecord::Migration
  def change
  	add_column :lunch_specials, :user_id, :integer
  end
end
