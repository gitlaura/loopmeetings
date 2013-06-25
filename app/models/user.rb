class User
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :recoverable, :rememberable, :trackable, :validatable, :database_authenticatable
  devise :registerable, :rememberable


  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  field :first_name
  field :last_name
  field :phone
  field :linkedin
  field :employer
  field :job_title
  field :job_description
  field :birthday, :type => Date
  field :hobbies
  field :resume
  field :resume_cache

  field :networking_goals
  # field :job_search_status
  # field :match_preferences
  field :industry_interests
  field :why_interested

  field :coffee_or_lunch
  field :times
  field :neighborhoods

  field :questions

  field :marketing_campaign,        :type => Moped::BSON::ObjectId

  field :referral


  validates_presence_of :full_name, :email, :phone, :birthday, :linkedin,
                        :hobbies, :networking_goals, :why_interested,
                        :times, :neighborhoods, :name

  mount_uploader :resume, ResumeUploader

  # attr_accessible :full_name

  has_many :invitations

  rails_admin do
    configure :invitations, :has_many_association
    show do
      configure :marketing_campaign do
        formatted_value do
          mc = MarketingCampaign.find(bindings[:object].marketing_campaign)
          bindings[:view].link_to mc.name, controller: "rails_admin/main", action: "show", model_name:'MarketingCampaign', id: mc.id
        end
      end
    end
    list do
      field :email
      field :full_name_caps
      field :id

    end
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def full_name_caps
    f_name = ""
    l_name = ""
    f_name = first_name.capitalize unless first_name.nil?
    l_name = last_name.capitalize unless last_name.nil?
    "#{f_name} #{l_name}"
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end

  def name
    email
  end

  def apply_marketing_campaign(marketing_campaign_id)
    self.marketing_campaign = marketing_campaign_id
    self.save
  end

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
end
