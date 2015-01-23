class DropUserIdFromPackets < ActiveRecord::Migration
  def change
  	remove_column :packets, :user_id
  end
end
