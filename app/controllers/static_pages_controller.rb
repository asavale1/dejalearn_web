class StaticPagesController < ApplicationController

	def home

	end

	def email
		
		if params[:name].empty? or params[:email].empty?
		Mailer.notify_email(params[:name], params[:email]).deliver
		redirect_to action: "home"
		end
	end

end

