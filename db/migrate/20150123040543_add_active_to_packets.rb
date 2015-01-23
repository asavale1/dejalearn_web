class AddActiveToPackets < ActiveRecord::Migration
  def change
    add_column :packets, :active, :boolean
  end
end
