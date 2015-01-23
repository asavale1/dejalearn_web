class CreateTagPackets < ActiveRecord::Migration
  def change
    create_table :tag_packets do |t|
    	t.integer :tag_id
    	t.integer :packet_id
    end
  end
end
