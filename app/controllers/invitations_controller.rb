class InvitationsController < ApplicationController

  def new
  end

  def create

    unless params[:your_email].nil? || params[:your_email].blank?
      user = User.find_or_initialize_by(email: params[:your_email])
    else
      user = User.new
    end

    name_array = params[:your_name].split unless params[:your_name].nil?
    if user.first_name.nil? && !name_array.nil?
      user.first_name = name_array[0]
      user.last_name = name_array[1]
    end

    user.save(validate: false)


    unless params[:invite_email].nil?
      params[:invite_email].each do |e|
        unless e.blank?
          inv = user.invitations.create! email: e
          InvitationWorker.perform_async(inv.id.to_s)
        end
      end
    end


    redirect_to invitations_path
  end

  def index
  end

end
