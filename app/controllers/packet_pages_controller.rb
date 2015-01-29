class PacketPagesController < ApplicationController
	include PacketPagesHelper

	before_filter :verify_signed_in
	skip_before_filter :verify_signed_in, :only => [:sign_in_dash, :log_in, :sign_up, :get_packet]
	skip_before_filter :verify_authenticity_token, :only => :get_packet

	def sign_in_dash
		
	end

	def log_in

		user = User.where("email = ?", params[:email]).first

		if !user.nil? and user.valid_password?(params[:password])
			sign_in(:user, user)
		else
			flash[:fail] = "* email or password incorrect"	
		end
		
		redirect_to action: "create_packet"
	end

	def sign_up
		user = User.new(:email => "#{params[:email]}", :password => "#{params[:password]}", :password_confirmation => "#{params[:password_confirmation]}")

		if verify_recaptcha == true
			if user.save 
				puts "\n\nUSER.SAVE FAILED\n"
				sign_in(:user, user)
				render :js => "window.location = '#{dashboard_create_path}'"
			else
				count = 0
				errors = Hash.new
				user.errors.full_messages.each do |message|
		    		puts message.class.name
		    		errors[count] = message
		    		count += 1
		  		end
		  		puts errors.to_json
				render :json => errors.to_json
			end
		else
			render :json => "Captcha failed"
		end
		
	end

	def dashboard
		puts "\n\nHELLO\n\n#{user_signed_in?}"
	end

	def create_packet
=begin
		tag = Tag.first
		#tag.packets.each do |pack|
		#	puts "\n\n#{pack}\n\n"
		#end
		puts "\n\n#{tag.packets}\n\n"
=end
		puts "\n\n"
		Packet.last.xml

		puts "\n\n"
		@index = 0
	end

	def submit_packet

		packet = Packet.new
		packet.title = params[:title]
		packet.description = params[:desc]
		packet.count = params[:count]
		packet.active = false
		PacketPagesHelper.save_tags(params[:tags], packet)
		packet.save

		PacketPagesHelper.save_images(params, packet.id)		
		packet.xml = PacketPagesHelper.create_xml(params, packet.id)
		packet.created_by = current_user.id
		packet.save
		
		puts "\n\n"
		puts params
		puts "\n\n"

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
		packets = Packet.where("lower(title) LIKE ?", "%#{query.downcase}%")

		packets.each_with_index do |packet, index|
			data[index] = {
				:id => packet.id,
				:packet_title => packet.title,
				:description => packet.description,
				:url => PacketPagesHelper.get_alt_url(packet.xml),
				:ex_count => packet.count
			}
		end

		puts "\n\n"
		puts data.to_json
		puts "\n\n"
		render :json => data.to_json
	end	

	private
		def get_question_layout(type)
			question_render = nil

			if type == "MC"
				question_render = render_to_string partial: 'packet_pages/question_partials/mc_question'
			elsif type == "IMC"
				question_render = render_to_string partial: 'packet_pages/question_partials/imc_question'
			elsif type == "FIB"
				question_render = render_to_string partial: 'packet_pages/question_partials/fib_question'
			end

			return question_render
		end

		def verify_signed_in
			unless user_signed_in?
				redirect_to :action => "sign_in_dash", "data-no-turbolink" => true
			end 
		end
		
end