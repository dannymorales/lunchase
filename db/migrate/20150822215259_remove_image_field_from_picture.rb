class RemoveImageFieldFromPicture < ActiveRecord::Migration
  def change
  	remove_column :pictures, :image, :string
  end
end
