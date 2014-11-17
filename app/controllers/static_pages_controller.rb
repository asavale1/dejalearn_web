class StaticPagesController < ApplicationController

	def home

	end

	def email
		
		if !params[:name].empty? and !params[:email].empty?

			Mailer.notify_email(params[:name], params[:email]).deliver
		end
		redirect_to action: "home"
		
	end

	def notify

	end

end

