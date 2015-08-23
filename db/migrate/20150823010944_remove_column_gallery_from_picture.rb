class RemoveColumnGalleryFromPicture < ActiveRecord::Migration
  def change
  	remove_column :pictures, :gallery_id
  	remove_column :pictures, :description
  end
end
