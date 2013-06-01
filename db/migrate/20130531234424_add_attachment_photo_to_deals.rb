class AddAttachmentPhotoToDeals < ActiveRecord::Migration
  def self.up
    change_table :deals do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :deals, :photo
  end
end
