class RegistrationsController < Devise::RegistrationsController


  # POST /resource
  def create
    build_resource

    if resource.save

      unless session[:marketing_referrer_id].nil?
        resource.apply_marketing_campaign(session[:marketing_referrer_id])
        session[:marketing_referrer_id] = nil
      end

      # unless session[:ppc_referral_token].nil?
      #   resource.ppc_referral_token = session[:ppc_referral_token]
      #   resource.save
      #   session[:ppc_referral_token] = nil
      # end

      if resource.active_for_authentication?
        flash[:notice] = "Thank you for applying! We'll be in touch soon."
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end

    else
      clean_up_passwords resource
      respond_with resource
    end

  end


  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(params[:user])
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(params[:user])
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

protected

	def needs_password?(user, params)
    !params[:user][:password].blank?
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end

end