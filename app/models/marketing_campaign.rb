class MarketingCampaign
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,          type: String
  field :slug,          type: String
  field :active,        type: Boolean, :default => false
  field :description,   type: String
  field :visits,        type: Integer, :default => 0

  validates_presence_of :name, :slug
  validates_uniqueness_of :slug

  attr_accessible :name, :slug, :active, :visits, :description

   def increment_visits
    self.visits ||= 0
    self.visits += 1
    self.save
  end

  def converted
    User.where(marketing_campaign: id).count
  end

  rails_admin do
    edit do
      configure :visits do
        hide
      end
    end
    list do
      field :name
      field :visits
      configure :slug do
        formatted_value do
          'http://www.mavenmeetings.com/r/'+ bindings[:object].slug
        end
      end
      field :slug
      field :active
    end
    show do
      field :slug
      configure :slug do
        formatted_value do
          'http://www.mavenmeetings.com/r/'+ bindings[:object].slug
        end
      end
      field :converted
      field :visits
      field :name
      field :active
      field :description
    end
  end

end