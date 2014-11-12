class StaticPagesController < ApplicationController

	def home

	end

	def email
		if params[:name].empty? or params[:email].empty?
		Mailer.notify_email(params[:name], params[:email]).deliver
		redirect_to action: "home"
		end
	end

	def email2
		if params[:name].empty? or params[:email].empty? or params[:content].empty?
		Mailer.notify_email2(params[:name],params[:email],params[:content]).deliver
		end
		redirect_to action: "home"
	end

end

