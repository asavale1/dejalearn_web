class PacketPagesController < ApplicationController
	#include Devise::Controllers::InternalHelpers
	include PacketPagesHelper
#	before_action :authenticate_user!
	#before_filter :require_no_authentication, :only => [:sign_in, :log_in, :sign_up]
	before_filter :verify_signed_in
	skip_before_filter :verify_signed_in, :only => [:sign_in, :log_in, :sign_up, :get_packet]
	skip_before_filter :verify_authenticity_token, :only => :get_packet

	def sign_in_dash
		
		#@user_log_in = User.new
		#@user_sign_up = User.new
	end

	def log_in
		puts "\n\n"
		puts params[:user]
		puts "\n\n"

		user = User.where("email = ?", params[:email]).first
		puts user
		sign_in(:user, user)
		redirect_to action: "dashboard"
	end

	def sign_up
		user = User.new(:email => "#{params[:email]}", :password => "#{params[:password]}", :password_confirmation => "#{params[:password_confirmation]}")
		user.save
		puts "\n\n"
		if user.save
			render :js => "window.location = '#{dashboard_path}'"
		else
			count = 0
			errors = Hash.new
			user.errors.full_messages.each do |message|
	    		puts message.class.name
	    		errors[count] = message
	    		count += 1
	  		end
			render :json => errors.to_json
		end
		
		puts user
		puts "\n\n"

		
	end

	def dashboard
		puts "\n\nHELLO\n\n"
	end

	def create_packet
		@index = 0
	end

	def submit_packet

		packet = Packet.new
		packet.title = params[:title]
		packet.description = params[:desc]
		packet.tag = params[:tags]
		packet.count = params[:count]
		packet.save

		PacketPagesHelper.save_images(params, packet.id)		
		packet.xml = PacketPagesHelper.create_xml(params, packet.id)
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
		packets = Packet.where("lower(title) LIKE ?", "%#{query.downcase}%")

		packets.each_with_index do |packet, index|
			data[index] = {
				:title => packet.title,
				:description => packet.description,
				:location => PacketPagesHelper.get_alt_url(packet.xml),
				:count => packet.count
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
			puts "\n\n"
			puts user_signed_in?
			puts "\n\n"
			unless user_signed_in?
				redirect_to :action => "sign_in"
			end 
		end
		
end