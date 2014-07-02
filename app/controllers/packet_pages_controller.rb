class PacketPagesController < ApplicationController
	def dashboard

	end

	def create_packet
		@index = 0
	end

	def render_question
		@index = params[:index].to_i + 1
		render :json => {
			:html => (render_to_string partial: 'packet_pages/question_partials/mc_question'),
			:index => @index
		}
	end
end