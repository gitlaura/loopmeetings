class Invitation

  include Mongoid::Document
  include Mongoid::Timestamps::Short

  belongs_to :user

  field :email
  field :success, type: Boolean


  rails_admin do
    configure :user, :belongs_to_association
  end

  def name
    email
  end
end


# class ContactForm < MailForm::Base
#   attribute :your_email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
#   attribute :email1,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
#   attribute :email2,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
#   attribute :email3,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
#   attribute :email4,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
#   attribute :email5,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

#   # Declare the e-mail headers. It accepts anything the mail method
#   # in ActionMailer accepts.
#   def headers
#     {
#         :subject => "Maven Friend Invites",
#         :to => "sara@sbxind.com",
#         :from => "Maven"
#     }
#   end
# end