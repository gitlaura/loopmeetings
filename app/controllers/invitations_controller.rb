class InvitationsController < ApplicationController

  def new
  end

  def create

    unless params[:your_name].nil?

      name_array = params[:your_name].split
      user = User.find_or_initialize_by(first_name: name_array[0] , last_name: name_array[1] )
      user.save(validate: false)

      unless params[:invite_email].nil?
        params[:invite_email].each do |e|
          unless e.blank?
            inv = user.invitations.create! email: e
            InvitationWorker.perform_async(inv.id.to_s)
          end
        end
      end

    end
    redirect_to invitations_path
  end

  def index
  end

end