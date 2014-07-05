class AddAttachmentXmlToPackets < ActiveRecord::Migration
  def self.up
    change_table :packets do |t|
      t.attachment :xml
    end
  end

  def self.down
    drop_attached_file :packets, :xml
  end
end
