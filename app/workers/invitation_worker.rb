class InvitationWorker

  include Sidekiq::Worker
  sidekiq_options failures: true


  def perform(invitation_id)
    inv = Invitation.find(invitation_id)
    begin
      InvitationMailer.invite(inv.email).deliver
      inv.success = true
    rescue
      inv.success = false
    end
    inv.save
  end

end