class AddAttachmentImageToDeals < ActiveRecord::Migration
  def self.up
    add_attachment :deals, :image
  end

  def self.down
    remove_attachment :deals, :image
  end
end
