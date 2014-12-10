class UserMailer < ActionMailer::Base
  default from: "damientardy1984@gmail.com"

  def send_email(sender, receiver, subject, content)
    @sender = sender
    @receiver = receiver
    @content = content
    mail(from: @sender, to: @receiver, subject: 'Hello!').deliver
  end
end
