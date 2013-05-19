class MessageMailer < ActionMailer::Base
  include FormatContent
  
  default from: "admin@studyworx.net"
  
  # This sends messages to individule users when private messaging
  #  Called from messages_controller
  def user_email(sender,recipient,email_subject,message)
    @sender = sender
    @recipient = recipient
    @message = message
    @html_body = markdown_to_html(message.body)
    to_addr = "#{recipient.fullname} <#{recipient.email}>"
    from_addr = "#{sender.fullname} <#{sender.email}>"
    @url = "http://studyworx.net/schools"
    mail(to: to_addr,
      from: from_addr, 
      reply_to: from_addr,
      subject: email_subject )
  end
  
  # This sends messages to all team members.
  #  Called from team_messages_controller
  def team_email(sender,team,email_subject,message)
    @sender = sender
    recipient = team.users.all.map(&:email)
    @message = message
    @html_body = markdown_to_html(message.body)
    to_addr = recipient
    from_addr = "#{sender.fullname} <#{sender.email}>"
    @url = "http://studyworx.net/schools"
    mail(to: to_addr,
          from: from_addr,
          reply_to: from_addr,
          subject: email_subject)
  end
  
end
