class Mailer < ActionMailer::Base
  default from: "notify@dejalearn.com"

  def notify_email(name, email)
  	@name = name
  	@email = email
  	mail(to: 'asavale1@yahoo.com', subject: 'Notify about app')
  end

end
