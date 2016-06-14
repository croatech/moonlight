class AddAttachmentImageToItems < ActiveRecord::Migration
  def self.up
    change_table :item_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :item_items, :image
  end
end
