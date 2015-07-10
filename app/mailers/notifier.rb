class Notifier < ActionMailer::Base
  default from: "tompossin@studyworx.net"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.admin.subject
  #
  #####################################################################
  ##################### ORDERS NOTIFIERS ##############################
  
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
  ########################### END ORDERS #####################################
  ############################################################################
  
  ############################################################################
  ########################### PARTICIPANTS (REGISTRATIONS) ###################
  
  def participant_user(participant,school)
    @participant = participant
    @school = school
    admin_user_ids = Participant.where("school_id = ? and role_id < ?",@school.id,3).all.map(&:user_id)
    schooladmins = User.where(id: admin_user_ids).all.map(&:email)
    @applicant = User.find(@participant.user_id)
    applicant_email = "#{@applicant.fullname} <#{@applicant.email}>"

    mail to: applicant_email,
          reply_to: schooladmins,
          subject: "Thank you for your recent registration to " + @school.name
  end
  
  def participant_admins(participant,school)
    @participant = participant
    @school = school
    admin_user_ids = Participant.where("school_id = ? and role_id < ?",@school.id,3).all.map(&:user_id)
    schooladmins = User.where(id: admin_user_ids).all.map(&:email)
    @applicant = User.find(@participant.user_id)
    applicant_email = "#{@applicant.fullname} <#{@applicant.email}>"

    mail to: schooladmins,
          from: applicant_email,
          reply_to: applicant_email,
          subject: @applicant.fullname + " has registered to " + @school.name + " and is waiting for acceptance."
  end
  
  ####################### END PARTICIPANTS (REGISTRATIONS) ################### 
  ############################################################################
  
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
