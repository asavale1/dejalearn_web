class StaticPagesController < ApplicationController

	def home

	end

	def email
		
		flash[:notice] = "Unsuccessful"
		if !params[:name].empty? and !params[:email].empty?
			if verify_recaptcha
				Mailer.notify_email(params[:name], params[:email]).deliver
				flash[:notice] = "Successful"
			end
		end
		redirect_to action: "notify"
		
	end

	def contact_email
		flash[:notice] = "Unsuccessful"
		if !params[:name].empty? and !params[:email].empty? and !params[:message].empty?
			if verify_recaptcha
				Mailer.contact_email(params[:name], params[:email], params[:message]).deliver
				flash[:notice] = "Successful"
			end
		end
		redirect_to "#{root_path}#4"
	end

	def notify

	end

end

