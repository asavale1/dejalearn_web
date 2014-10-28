class Mailer < ActionMailer::Base
  default from: "notify@dejalearn.com"

  def notify_email(name, email,content)
  	@name = name
  	@email = email
  	@Content = content
  	mail(to: 'asavale1@yahoo.com', subject: 'Notify about app')
  end

end
