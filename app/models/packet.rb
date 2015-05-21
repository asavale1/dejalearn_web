#
# => title			varchar(255)
# => description	text
# => tag			text
# => xml			attachment
# => count			integer
#
class Packet < ActiveRecord::Base
	has_many :downloads
	has_many :users, :through => :downloads

	has_many :tag_packets, dependent: :destroy
	has_many :tags, :through => :tag_packets

	#has_many :images, dependent: :destroy

	has_attached_file :xml
	validates_attachment_content_type :xml, :content_type => ["text/xml", "application/xml"] 

end
