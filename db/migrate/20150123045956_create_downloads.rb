class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
    	t.integer :user_id
    	t.integer :packet_id
    end
  end
end
