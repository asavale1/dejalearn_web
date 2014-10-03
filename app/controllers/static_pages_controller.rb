class StaticPagesController < ApplicationController

	def home

	end

	def email
		Mailer.notify_email(params[:name], params[:email]).deliver
		redirect_to action: "home"
	end

end
