class Mailer < ActionMailer::Base
  default from: "notify@zestconsulting.com"

  def notify_email(name, email)
  	@name = name
  	@email = email
  	mail(to: 'asavale1@yahoo.com', subject: 'Notify about app')
  end

  def contact_email(name, email, message)
  	@name = name
  	@email = email
  	@message = message
  	mail(to: 'asavale1@yahoo.com', subject: "Contact about app")
  end



end
