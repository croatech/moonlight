class AddAttachmentImageToTools < ActiveRecord::Migration
  def self.up
    change_table :tool_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tool_items, :image
  end
end
