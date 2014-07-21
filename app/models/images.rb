#
# => packet_id		integer
# => question_id	integer
# => image			attachment
#
class Images < ActiveRecord::Base
	belongs_to :packet

	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpeg"]
end
