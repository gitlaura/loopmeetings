require 'mandrill'

class InvitationWorker

  include Sidekiq::Worker
  sidekiq_options failures: true


  def perform(invitation_id)
    inv = Invitation.find(invitation_id)

    m = Mandrill::API.new('1eMJsTs_5HDZAMlQSZu7Kw')
    m.messages.send_template("You are Invited",
          [{
            "name"=> "example name",
            "content"=> "example content"
          }],
          {
            "to"=> [
                {
                    "email"=> inv.email
                }
            ],
            "important"=> false,
            "track_opens"=> true,
            "track_clicks"=> true,
            "global_merge_vars"=> [
                {
                    "name"=> "sender",
                    "content"=> inv.user.full_name_caps
                }
            ]
          }, async=false)
      inv.success = true
      inv.save

  end

end