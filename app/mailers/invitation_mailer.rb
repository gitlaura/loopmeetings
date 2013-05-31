class InvitationMailer < ActionMailer::Base

  default :from => "Maven <sara@sbxind.com>",
          :reply_to => "Laura <laura@sandboxindustries.com>"

  def invite(email)
    mail(:to => email,
         :subject => "Maven Friend Invites")
  end

end