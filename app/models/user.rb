class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
  field :birthday, type: Date
  field :hobbies
  field :resume
  field :resume_cache

  field :networking_goals
  field :job_search_status
  field :match_preferences
  field :industry_interests
  field :why_interested

  field :coffee_or_lunch
  field :times
  field :neighborhoods

  field :questions

  validates_presence_of :full_name, :email, :phone, :linkedin, :employer, :job_title, :job_description, :birthday, :hobbies, :networking_goals, :job_search_status, :match_preferences, :industry_interests, :why_interested, :coffee_or_lunch, :times, :neighborhoods

  mount_uploader :resume, ResumeUploader

  def full_name
    if new_record?
      ""
    else
      [first_name, last_name].join(' ')
    end
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
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
