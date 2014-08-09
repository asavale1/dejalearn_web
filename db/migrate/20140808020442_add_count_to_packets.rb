class AddCountToPackets < ActiveRecord::Migration
  def change
    add_column :packets, :count, :integer
  end
end
