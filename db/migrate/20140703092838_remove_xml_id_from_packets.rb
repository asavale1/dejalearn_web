class RemoveXmlIdFromPackets < ActiveRecord::Migration
  def change
    remove_column :packets, :xml_id, :integer
  end
end
