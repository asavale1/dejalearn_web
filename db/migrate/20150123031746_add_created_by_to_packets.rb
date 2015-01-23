class AddCreatedByToPackets < ActiveRecord::Migration
  def change
    add_column :packets, :created_by, :integer
  end
end
