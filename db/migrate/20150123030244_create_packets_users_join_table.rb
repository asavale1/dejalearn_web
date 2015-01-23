class CreatePacketsUsersJoinTable < ActiveRecord::Migration
	def self.up 
		create_table :packets_users, :id => false do |t|
			t.integer :packet_id
			t.integer :user_id
		end

		add_index :packets_users, [:packet_id, :user_id]
	end

	def self.down
		drop_table :packets_users
	end
end
