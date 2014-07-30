class PacketPagesController < ApplicationController
	include PacketPagesHelper
	skip_before_filter :verify_authenticity_token, :only => :get_packet

	def dashboard
		@packet = Packet.last
		@images = Images.where("packet_id = ?", @packet.id).first
		puts @images
	end

	def create_packet
		@index = 0
	end

	def submit_packet
		
		packet = Packet.new
		packet.title = params[:title]
		packet.description = params[:desc]
		packet.tag = params[:tags]
		packet.save

		save_images(params, packet.id)		
		packet.xml = create_xml(params, packet.id)
		packet.save

		redirect_to action: "create_packet"
	end

	def render_question
		@index = params[:index].to_i + 1
		question_render = get_question_layout(params[:type])

		render :json => {
			:html => question_render,
			:index => @index
		}
	end

	def check_title
		puts params[:title]
		packet = Packet.where("title = ?", params[:title].strip)
	
		if packet.length == 0
			render :json => { :valid => true }
		else
			render :json => { :valid => false }
		end
	end

	def get_packet
		data = {}
		query = params[:query]
		packets = Packet.where("title LIKE ?", "%#{query}%")

		packets.each_with_index do |packet, index|
			data[index] = {
				:title => packet.title,
				:description => packet.description,
				:location => get_alt_url(packet.xml)
			}
		end

		puts "\n\n"
		puts data.to_json
		puts "\n\n"
		render :json => data.to_json
	end

	private
		def get_alt_url(url)
			url = url.to_s.gsub("http://s3.amazonaws.com/dejalearn" ,"http://dejalearn.s3.amazonaws.com")
			puts url
			return url
		end
		
end