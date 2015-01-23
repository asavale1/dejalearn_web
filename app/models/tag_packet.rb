class TagPacket < ActiveRecord::Base
	belongs_to :tag
	belongs_to :packet
end
