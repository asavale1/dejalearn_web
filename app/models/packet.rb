#
# => title			varchar(255)
# => description	text
# => tag			text
# => xml			attachment
# => count			integer
#
class Packet < ActiveRecord::Base
	belongs_to :user
	has_many :images, dependent: :destroy

	has_attached_file :xml
	validates_attachment_content_type :xml, :content_type => ["text/xml", "application/xml"] 
end
