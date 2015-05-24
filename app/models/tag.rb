class Tag < ActiveRecord::Base
	has_many :tag_packets, dependent: :destroy
	has_many :packets, :through => :tag_packets

	validates :tag, uniqueness: { case_sensitive: false }
end