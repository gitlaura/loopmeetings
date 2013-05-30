class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
      @contact_form = ContactForm.new(params[:contact_forms])
      @contact_form.request = request
      if @contact_form.deliver
        flash.now[:notice] = 'Thank you for inviting friends!'
      else
        render :new
      end
    rescue ScriptError
      flash[:error] = 'Sorry, an error occurred and your invites were not sent.'
    end
  end
end
