class AddAttachmentImageToBusinesses < ActiveRecord::Migration
  def self.up
    add_attachment :businesses, :image
  end

  def self.down
    remove_attachment :businesses, :image
  end
end
