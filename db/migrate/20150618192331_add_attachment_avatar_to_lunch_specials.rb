class AddAttachmentAvatarToLunchSpecials < ActiveRecord::Migration
  def self.up
    change_table :lunch_specials do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :lunch_specials, :avatar
  end
end
