class AddAttachmentImageToBots < ActiveRecord::Migration
  def self.up
    change_table :bots do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :bots, :image
  end
end
