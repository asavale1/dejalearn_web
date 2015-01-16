class AddUserRefsToPackets < ActiveRecord::Migration
  def change
  	add_reference :packets, :user, index: true
  end
end
