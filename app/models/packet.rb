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

	has_many :tag_packets
	has_many :tags, :through => :tag_packets

	has_many :images, dependent: :destroy

	has_attached_file :xml,
					  :url => '/system/:access_token/foto_:style.:extension',
					  :path => ':rails_root/public:url'
	validates_attachment_content_type :xml, :content_type => ["text/xml", "application/xml"] 

end
