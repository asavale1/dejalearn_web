class Mailer < ActionMailer::Base
  default from: "notify@dejalearn.com"

  def notify_email(name, email)
  	@name = name
  	@email = email
  	mail(to: 'ameyasavale@gmail.com', subject: 'Notify about app')
  end

  def contact_email(name, email, message)
  	@name = name
  	@email = email
  	@message = message
  	mail(to: 'ameyasavale@gmail.com', subject: "Contact about app")
  end

  def feedback_email(feedback)
    @feedback = feedback
    mail(to: 'ameyasavale@gmail.com', subject: 'Dejalearn Feedback')
  end

  def packet_request_email(packets)
    @packets = packets
    mail(to: 'ameyasavale@gmail.com', subject: 'Dejalearn Packet Request')
  end



end

