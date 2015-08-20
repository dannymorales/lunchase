class AddForeignKeyToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :lunch_special_id, :integer
  end
end
