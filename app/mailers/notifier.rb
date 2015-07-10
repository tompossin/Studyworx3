class Notifier < ActionMailer::Base
  default from: "tompossin@studyworx.net"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.admin.subject
  #
  
  # This method sends an email to the superuser when a school is ordered
  def admin(order)
    @order = order
    superadmin = "Tom Possin <tompossin@studyworx.net>"
    @customer = User.find(@order.user_id)
    sender = "#{@customer.fullname} <#{@customer.email}>"

    mail to: superadmin,
          from: sender,
          reply_to: sender,
          subject: @customer.fullname + " has placed an order for a new school"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.user.subject
  #
  
  # This method sends an email to the customer when they place an order
  def user(order)
    @order = order
    superadmin = "Tom Possin <tompossin@studyworx.net>"
    @customer = User.find(@order.user_id)
    customer_email = "#{@customer.fullname} <#{@customer.email}>"

    mail to: customer_email,
          from: superadmin,
          reply_to: superadmin,
          subject: "Thank you for your recent order of a new Studyworx school"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.group.subject
  #
  
  # This will be for group notifications (NOT USED YET)
  def group
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
